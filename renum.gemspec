
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "renum/version"

Gem::Specification.new do |spec|
  spec.name          = "renum"
  spec.version       = Renum::VERSION
  spec.authors       = ["John Hume"]
  spec.email         = "duelin.markers@gmail.com"

  spec.summary       = "provides a readable but terse enum facility for Ruby"
  spec.description   = "provides a readable but terse enum facility for Ruby"
  spec.homepage      = "http://github.com/duelinmarkers/renum"
  spec.license       = "MIT"

  spec.extra_rdoc_files = [
    "README.textile"
  ]
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
end

