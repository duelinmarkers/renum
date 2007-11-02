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
    
    attr_reader :name
    
    def initialize name
      @name = name.to_s
      self.class.values << self
    end
    
    def to_s
      "#{self.class}::#{name}"
    end
    
    def index
      self.class.values.index self
    end
    
  end
end