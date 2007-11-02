$:.unshift File.dirname(__FILE__)
require 'renum/enumerated_value'

module Renum
  def enum type_name, values, &block
    klass = Class.new EnumeratedValue
    Object.const_set(type_name, klass)
    klass.class_eval &block if block_given?
    values.each do |name|
      klass.const_set(name, klass.new(name))
    end
  end
end

extend Renum
