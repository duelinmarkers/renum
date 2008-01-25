begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

if ENV['USE_GEM']
  require 'rubygems'
  require 'renum'
else
  require File.expand_path(File.dirname(__FILE__) + '/../lib/renum')
end
