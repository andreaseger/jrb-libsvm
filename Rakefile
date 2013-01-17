require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc "compile libsvm.jar from sources"
task :compile do
  Dir.chdir('java') do
    print `javac libsvm/*.java`
    print `jar cvf libsvm.jar libsvm/*.class libsvm/*.java COPYRIGHT`
  end
  FileUtils.rm_r Dir['java/libsvm/*.class']
  FileUtils.mv 'java/libsvm.jar','lib/java/libsvm.jar'
  p "lib/java/libsvm.jar generated"
end

RSpec::Core::RakeTask.new('spec')
task :default => :spec