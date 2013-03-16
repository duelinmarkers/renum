require 'forwardable'

module Renum

  # This is the superclass of your enumeration classes.
  # The class methods defined here are intended to be called on your enumerated value classes.
  # An enumeration class is Enumerable over its values and exposes them by numeric index via [].
  # Values are also comparable, sorting into the order in which they're declared.
  class EnumeratedValue

    class << self
      include Enumerable
      extend Forwardable

      def_delegators :values, :each, :[]

      # @return [Array] values of this type in the order they're declared.
      def values
        @values ||= []
      end

      # Lookup by name.
      # @param [String] name of the value you want
      # @return [EnumeratedValue, nil] the value with `name` or nil if there is no value by that name
      def with_name name
        values_by_name[name]
      end

      # @return [{String => EnumeratedType}] values keyed by name.
      def values_by_name
        @values_by_name ||= values.inject({}) do |memo, value|
          memo[value.name] = value
          memo
        end.freeze
      end

    end

    include Comparable

    attr_reader :name, :index

    # You should never directly new-up an EnumeratedValue, so this is basically internal.
    # It sets up the value with its class, so if you override, be sure to call super!
    # Better yet define init as shown in the README.
    def initialize name
      @name = name.to_s.freeze
      @index = self.class.values.size
      self.class.values << self
    end

    # Returns the fully qualified name of the constant referring to this value.
    # Don't override this if you're using Renum with the constantize_attribute
    # plugin, which relies on this behavior.
    def to_s
      "#{self.class}::#{name}"
    end

    # Sorts enumerated values into the order in which they're declared.
    def <=> other
      index <=> other.index
    end

    def == other
      equal? other
    end
  end
end
