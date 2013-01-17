require "bundler/gem_tasks"

require 'rspec/core/rake_task'

desc "compile libsvm.jar from sources"
task :compile do
  print `javac java/libsvm/*.java`
  print `jar cvf lib/java/libsvm.jar java/libsvm/*.class java/libsvm/*.java java/COPYRIGHT`
  FileUtils.rm_r Dir['java/libsvm/*.class']
  p "lib/java/libsvm.jar generated"
end

task :default => :spec