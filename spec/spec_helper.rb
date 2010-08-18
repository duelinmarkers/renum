begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

if ENV['USE_GEM']
  require 'rubygems'
end
require 'renum'
