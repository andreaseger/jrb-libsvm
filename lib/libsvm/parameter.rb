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

    # Constructor sets up values of attributes based on provided map.
    # Valid keys with their default values:
    # * :svm_type = Parameter::C_SVC, for the type of SVM
    # * :kernel_type = Parameter::LINEAR, for the type of kernel
    # * :cost = 1.0, for the cost or C parameter
    # * :gamma = 0.0, for the gamma parameter in kernel
    # * :degree = 1, for polynomial kernel
    # * :coef0 = 0.0, for polynomial/sigmoid kernels
    # * :eps = 0.001, for stopping criterion
    # * :nr_weight = 0, for C_SVC
    # * :nu = 0.5, used for NU_SVC, ONE_CLASS and NU_SVR. Nu must be in (0,1]
    # * :p = 0.1, used for EPSILON_SVR
    # * :shrinking = 1, use the shrinking heuristics
    # * :probability = 0, use the probability estimates
    def initialize args={}
      super()
      self.svm_type    = args.fetch(:svm_type, Parameter::C_SVC)
      self.kernel_type = args.fetch(:kernel_type, Parameter::LINEAR)
      self.C           = args.fetch(:cost, 1.0)
      self.gamma       = args.fetch(:gamma, 0.0)
      self.degree      = args.fetch(:degree, 1)
      self.coef0       = args.fetch(:coef0, 0.0)
      self.eps         = args.fetch(:eps, 0.001)
      self.nr_weight   = args.fetch(:nr_weight, 0)
      self.nu          = args.fetch(:nu, 0.5)
      self.p           = args.fetch(:p, 0.1)
      self.shrinking   = args.fetch(:shrinking, 1)
      self.probability = args.fetch(:probability, 0)

      unless self.nu > 0.0 and self.nu <= 1.0
        raise ArgumentError "Invalid value of nu #{self.nu}, should be in (0,1]"
      end
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