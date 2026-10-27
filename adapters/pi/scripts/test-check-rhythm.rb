#!/usr/bin/env ruby
require "open3"
require "tmpdir"

script = File.expand_path("check-rhythm.rb", __dir__)
Dir.mktmpdir do |dir|
  path = File.join(dir, "rhythm.yaml")
  check = lambda do |mode, yaml, expected|
    File.write(path, yaml)
    out, err, status = Open3.capture3(script, mode, path)
    raise "#{mode}: #{out} #{err}" unless status.success? == !!expected
    raise "unexpected output: #{out} #{err}" unless (expected ? out.include?(expected) : err.start_with?("rhythm invalid:"))
  end
  check.call("day", "day_open:\n  strategy_day: friday\n", "strategy_day=friday")
  check.call("week", "day_open: {}\n", "strategy_day=monday week_close_day=sunday")
  check.call("day", "day_open: null\n", false)
  check.call("day", "day_open: [wrong]\n", false)
  check.call("day", "day_open:\n  strategy_day: Friday\n", false)
  check.call("week", "day_open:\n  week_close_day: 0\n", false)
  check.call("week", "day_open: [\n", false)
  File.delete(path)
  _, _, status = Open3.capture3(script, "day", path)
  raise "missing file passed" if status.success?
end
puts "rhythm guard: OK"
