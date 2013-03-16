module Renum
  class NameSerializer
    def initialize enum_class
      @enum_class = enum_class
    end

    def dump v
      v && v.name
    end

    def load s
      s && @enum_class.with_name(s)
    end
  end
end
