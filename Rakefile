require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

# Run rspec on the cookbook
RSpec::Core::RakeTask.new(:rspec => ["ci:setup:rspec"]) do |t|
  t.pattern = 'spec/*_spec.rb'
end

desc "Lint with foodcritic"
task :lint do
	exec "foodcritic -f correctness ."
end

desc "Run full check"
task :all do
	Rake::Task["rspec"].invoke
	Rake::Task["lint"].invoke
end

task :default => [:all]