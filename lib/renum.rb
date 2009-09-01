$:.unshift File.dirname(__FILE__)
require 'renum/enumerated_value_type_factory'

# Requiring 'renum' mixes the Renum module into both the main Object and 
# Module, so it can be called from anywhere that you might reasonably 
# define an enumeration with an implicit receiver.
module Renum

  # Figures out whether the new enumeration will live in Object or the 
  # receiving Module, then delegates to EnumeratedValueTypeFactory#create for 
  # all the real work.
  def enum type_name, values = :defined_in_block, &block
    nest = self.is_a?(Module) ? self : Object
    EnumeratedValueTypeFactory.create(nest, type_name, values, &block)
  end
end

extend Renum

Module.module_eval do
  include Renum
end
