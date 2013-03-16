require 'renum/enumerated_value_type_factory'
require 'renum/name_serializer'
require 'renum/index_serializer'

# Requiring 'renum' mixes the Renum module into both the main Object and
# Module, so it can be called from anywhere that you might reasonably
# define an enumeration with an implicit receiver.
module Renum

  # Declares an enumerated type. If called inside a module, the enumerated type class will
  # be nested inside that module.
  #
  # @param [Symbol] type_name The name of the EnumeratedType class to create
  # @param [optional, Array<Symbol, String>] values
  #   the names of the values in order, can be omitted if you'll specify them via method calls in a block
  # @param block can be used to specify values with method calls, instance methods
  def enum type_name, values = :defined_in_block, &block
    nest = self.is_a?(Module) ? self : Object
    EnumeratedValueTypeFactory.create(nest, type_name, values, &block)
  end
end

extend Renum

Module.module_eval do
  include Renum
end
