lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'benchmark'
require_relative 'runner'
require_relative 'liquid_runner'

runner = Runner.new
runner.prepare

liquid_runner = LiquidRunner.new
liquid_runner.prepare

Benchmark.bmbm do |x|
  x.report("liquid parse & run:")   { 100.times { liquid_runner.parse_and_run } }
  x.report("mandala load & run:")   { 100.times { runner.run } }
end

