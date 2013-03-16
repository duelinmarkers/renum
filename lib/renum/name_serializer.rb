module Renum
  class NameSerializer
    def initialize enum_class
      @enum_class = enum_class
    end

    def dump v
      v && if v.is_a?(String)
             v
           else
             v.name
           end
    end

    def load s
      s && @enum_class.with_name(s)
    end
  end
end
