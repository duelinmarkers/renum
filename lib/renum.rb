$:.unshift File.dirname(__FILE__)
require 'renum/enumerated_value_type_factory'

module Renum
  def enum type_name, values = :defined_in_block, &block
    nest = self.is_a?(Module) ? self : Object
    EnumeratedValueTypeFactory.create(nest, type_name, values, &block)
  end
end

extend Renum

Module.module_eval do
  include Renum
end
