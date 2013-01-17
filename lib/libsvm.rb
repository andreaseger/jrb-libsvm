require "libsvm/version"
require "java"
require "java/libsvm"

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

require 'libsvm/node'

class Hash
  include Libsvm::CoreExtensions::Collection
end
class Array
  include Libsvm::CoreExtensions::Collection
end
