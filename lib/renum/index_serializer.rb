module Renum
  class IndexSerializer
    def initialize enum_class
      @enum_class = enum_class
    end

    def dump v
      v && v.index
    end

    def load i
      i && @enum_class[i]
    end
  end
end
