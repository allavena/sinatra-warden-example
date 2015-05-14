require 'rubygems'
require 'bundler/setup'
Bundler.setup
require 'rake/testtask'
require 'pact/tasks'

desc("Run all our normal tests")
task(:test) do
  Rake::TestTask.new(:test) do |t|
    save_env= ENV['RACK_ENV']
    #Set the environment to test if not set, to make sure tests are run in test environment mode
    ENV['RACK_ENV'] ||= 'test'
    t.libs << 'spec'
    t.pattern = 'spec/**/*_spec.rb'
    ENV['RACK_ENV'] = save_env
  end
end

# desc('Run LGF Front-End consumer integration tests')
# task(:lgf_front_end_test) do
#   Rake::Task['pact:verify'].invoke
# end


task default: :test