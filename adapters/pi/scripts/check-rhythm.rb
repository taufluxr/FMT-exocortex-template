#!/usr/bin/env ruby
# Read-only guard: never discover plans if the rhythm configuration is invalid.
require "date"
require "yaml"

WEEKDAYS = %w[monday tuesday wednesday thursday friday saturday sunday].freeze

def fail_guard(reason)
  warn "rhythm invalid: #{reason}"
  exit 1
end

mode, path = ARGV
fail_guard("usage: check-rhythm.rb day|week PATH") unless ARGV.length == 2 && %w[day week].include?(mode)
fail_guard("file missing or unreadable") unless File.file?(path) && File.readable?(path)

begin
  config = YAML.safe_load_file(path)
rescue Psych::SyntaxError => e
  fail_guard("malformed YAML at line #{e.line}, column #{e.column}")
rescue Psych::Exception, SystemCallError => e
  fail_guard("cannot read safe YAML (#{e.class})")
end

fail_guard("root is not a mapping") unless config.is_a?(Hash)
day = config.fetch("day_open", {})
fail_guard("day_open is not a mapping") unless day.is_a?(Hash)
values = { "strategy_day" => "monday" }
values["week_close_day"] = "sunday" if mode == "week"
values.each do |key, default|
  value = day.fetch(key, default)
  fail_guard("invalid #{key}") unless value.is_a?(String) && WEEKDAYS.include?(value)
  values[key] = value
end

now = Date.today
puts "date=#{now.iso8601} weekday=#{WEEKDAYS[now.cwday - 1]} #{values.map { |key, value| "#{key}=#{value}" }.join(' ')}"
