require 'rake'
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "ar_mailer_rails3"
    s.summary = "ArMailer wrapper for Rails 3"
    s.email = "zhangyuanyi@gmail.com"
    s.homepage = "http://github.com/yzhang/ar_mailer_rails3"
    s.description = "ArMailer wrapper for Rails 3"
    s.authors = ["Yuanyi Zhang"]
    s.files =  FileList["[A-Z]*", "bin/*", "share/*", "test/*", "{lib}/**/*", '.gitignore']
    s.test_files = []
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end