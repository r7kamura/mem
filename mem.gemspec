# frozen_string_literal: true

require 'English'
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mem/version'

Gem::Specification.new do |spec|
  spec.name          = 'mem'
  spec.version       = Mem::VERSION
  spec.authors       = ['Ryo Nakamura']
  spec.email         = ['r7kamura@gmail.com']
  spec.summary       = 'Memoize method calls.'
  spec.homepage      = 'https://github.com/r7kamura/mem'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/releases"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.required_ruby_version = '>= 2.7'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
