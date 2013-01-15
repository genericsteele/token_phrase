# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'token_phrase/version'

Gem::Specification.new do |gem|
  gem.name          = "token_phrase"
  gem.version       = TokenPhrase::VERSION
  gem.authors       = ["Eric Steele"]
  gem.email         = ["eric@notvelcro.com"]
  gem.description   = %q{A token-phrase generator}
  gem.summary       = %q{Token Phrase is a simple generator that creates friendlier unique tokens as phrases}
  gem.homepage      = "https://github.com/genericsteele/token_phrase"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
