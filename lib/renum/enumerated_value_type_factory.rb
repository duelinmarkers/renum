require 'renum/enumerated_value'
module Renum
  module EnumeratedValueTypeFactory
    def create type_name, values, &block
      klass = Class.new EnumeratedValue
      Object.const_set(type_name, klass)
      klass.class_eval &block if block_given?
      values.each do |name|
        klass.const_set(name, klass.new(name))
      end
    end
    module_function :create
  end
end