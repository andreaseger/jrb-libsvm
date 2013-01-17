module Libsvm
  class Parameter
    alias :c :C
    alias :c= :C=

    def label_weights
      Hash[self.weight_label.zip(self.weight)]
    end
    def label_weights=v
      self.nr_weight = v.keys.size
      self.weight_label = v.keys.to_java :int
      self.weight =  v.values.to_java :double
    end
  end
  SvmParameter = Parameter
end