#! /usr/bin/env ruby
require 'rake'
require 'rake/gempackagetask'



desc 'Default: gem packaging'
task :default => "gem"


load "rb-pid-controller.gemspec"

Rake::GemPackageTask.new(GEMSPEC) do |pkg|
  # no other formats needed
end

