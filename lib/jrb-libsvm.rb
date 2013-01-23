require_relative "libsvm/version"
require "java"
require_relative "java/libsvm"

module Libsvm
  java_import "libsvm.Parameter"
  java_import "libsvm.Model"
  java_import "libsvm.Problem"
  java_import "libsvm.Node"
  java_import "libsvm.Svm"

  module CoreExtensions
    module Collection
      def to_example
        Node.features(self)
      end
    end
  end
end

require_relative 'libsvm/parameter'
require_relative 'libsvm/model'
require_relative 'libsvm/node'
require_relative 'libsvm/problem'

class Hash
  include Libsvm::CoreExtensions::Collection
end
class Array
  include Libsvm::CoreExtensions::Collection
end
