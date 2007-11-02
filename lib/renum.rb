$:.unshift File.dirname(__FILE__)
require 'renum/enumerated_value_type_factory'

module Renum
  def enum type_name, values, &block
    EnumeratedValueTypeFactory.create(type_name, values, &block)
  end
end

extend Renum
