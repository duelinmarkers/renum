require 'forwardable'

module Renum

  # This is the superclass of all enumeration classes. 
  # An enumeration class is Enumerable over its values and also delegates [] 
  # to the values array.
  # Values are also comparable, sorting into the order in which they're declared.
  class EnumeratedValue
    
    class << self
      include Enumerable
      extend Forwardable
      
      def_delegators :values, :each, :[]
      
      # Returns an array of values in the order they're declared.
      def values
        @values ||= []
      end
      
    end
    
    include Comparable
    attr_reader :name
    attr_reader :index
    
    def initialize name
      @name = name.to_s
      @index = self.class.values.size
      self.class.values << self
    end
    
    # Returns the fully qualified constant referring to this value.
    # Don't override this if you're using Renum with the constantize_attribute 
    # plugin, which relies on this behavior.
    def to_s
      "#{self.class}::#{name}"
    end
    
    # Sorts enumerated values into the order in which they're declared.
    def <=> other
      index <=> other.index
    end
    
  end
end