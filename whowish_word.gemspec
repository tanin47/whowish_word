# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "whowish_word"
  s.version     = "0.6.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tanin Na Nakorn"]
  s.email       = ["tanin47@yahoo.com"]
  s.homepage    = "http://github.com/tanin47/whowish_word"
  s.summary     = %q{whowish_word}
  s.description = %q{WYSIWYG for i18n for Rails 3.2.*}

  s.rubyforge_project = "whowish_word"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {rails,spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.autorequire = 'rubyzip'

  s.add_dependency('rubyzip')
end
