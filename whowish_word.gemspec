# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "whowish_word"
  s.version     = "0.4.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tanin Na Nakorn"]
  s.email       = ["tanin47@yahoo.com"]
  s.homepage    = "http://github.com/tanin47/whowish_word"
  s.summary     = %q{WhowishWord}
  s.description = %q{Inline internationlization for Rails 3.2.*}

  s.rubyforge_project = "whowish_word"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {rails,spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
