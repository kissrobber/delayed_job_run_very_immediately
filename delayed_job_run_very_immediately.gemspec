# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed_job_run_very_immediately/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed_job_run_very_immediately"
  spec.version       = DelayedJobRunVeryImmediately::VERSION
  spec.authors       = ["kissrobber"]
  spec.email         = ["kissrobber@gmail.com"]

  spec.summary       = %q{run job very inmmediately}
  spec.description   = %q{This adds an option to run a job on after_commit synchronously. If it fails it's treated in usual delayed_job process.}
  spec.homepage      = "https://github.com/kissrobber/delayed_job_run_very_immediately"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "delayed_job_active_record", "~> 4.0"
end
