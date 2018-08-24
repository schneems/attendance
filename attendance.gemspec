
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "attendance/version"

Gem::Specification.new do |spec|
  spec.name          = "attendance"
  spec.version       = Attendance::VERSION
  spec.authors       = ["schneems"]
  spec.email         = ["richard.schneeman+foo@gmail.com"]

  spec.summary       = %q{Changes behavior of Active Record present?}
  spec.description   = %q{Changes behavior of Active Record present?}
  spec.homepage      = "https://github.com/schneems/attendance"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",  "~> 1.16"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rails",    "~> 5.2.1"
  spec.add_development_dependency "sqlite3"

  spec.add_dependency "activerecord", ">= 4"
end

