require 'rubygems'
require 'bundler/setup'

require 'rake'
require 'rspec/core/rake_task'
require 'appraisal'

Bundler::GemHelper.install_tasks

desc 'Default: run unit tests.'
task :default => [:clean, :all]

desc "Run Specs against all Appraisals"
task :all => :spec do
  Rake::Task["appraisal:install"].execute
  system("bundle exec rake -s appraisal test")
end

desc "Run Specs"
RSpec::Core::RakeTask.new(:spec) do |t|
end

task :test => [:spec]

desc "Clean up files."
task :clean do |t|
  FileUtils.rm_rf "tmp"
  Dir.glob("micro_sessions-*.gem").each {|f| FileUtils.rm f }
end

