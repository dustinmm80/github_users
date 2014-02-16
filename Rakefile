require 'rspec/core/rake_task'

desc "Lint with foodcritic"
task :lint do
	exec "foodcritic -f correctness ."
end

desc "Run full check"
task :all do
	Rake::Task["lint"].invoke
end

task :default => [:all]
