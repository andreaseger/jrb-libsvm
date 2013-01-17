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

  module KernelType
    LINEAR = Parameter::LINEAR
    POLY = Parameter::POLY
    RBF = Parameter::RBF
    SIGMOID = Parameter::SIGMOID
    PRECOMPUTED = Parameter::PRECOMPUTED
  end
  module SvmType
    C_SVC = Parameter::C_SVC
    NU_SVC = Parameter::NU_SVC
    ONE_CLASS = Parameter::ONE_CLASS
    EPSILON_SVR = Parameter::EPSILON_SVR
    NU_SVR = Parameter::NU_SVR
  end
end