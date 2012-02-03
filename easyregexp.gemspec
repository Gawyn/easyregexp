# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easyregexp/version"

Gem::Specification.new do |s|
  s.name        = "easyregexp"
  s.version     = Easyregexp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Cristian Planas']
  s.email       = ['me@cristianplanas.com']
  s.homepage    = ""
  s.summary     = %q{'A regular expression generator'}
  s.description = %q{'Regular expression syntaxis is hard to remember. Easyregexp wants to make your life easier.'}

  s.rubyforge_project = "easyregexp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
