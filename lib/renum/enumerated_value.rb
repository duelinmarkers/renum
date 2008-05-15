require 'forwardable'

module Renum
  class EnumeratedValue
    
    class << self
      include Enumerable
      extend Forwardable
      
      def_delegators :values, :each, :[]
      
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
    
    def to_s
      "#{self.class}::#{name}"
    end
    
    def <=> other
      index <=> other.index
    end
    
  end
end