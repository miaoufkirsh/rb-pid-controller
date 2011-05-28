# -*- ruby -*-
require "rubygems"
require "rake"

GEMSPEC = Gem::Specification.new do |s|
  s.name = "rb-pid-controller"
  s.summary = "Library for creating PID controllers"
  s.description = <<-EOF
  Tools for PID control
  EOF
  s.version = File.read("VERSION").strip
  s.license = 'GPL-3'
  s.author = "MiaoufKirsh"
  s.files = FileList["{lib}/**/*", "rb-pid-controller.gemspec", "VERSION"].to_a.sort
  s.require_path = "lib"
  s.has_rdoc = false
end
