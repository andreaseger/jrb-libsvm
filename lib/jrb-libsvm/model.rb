java_import 'java.io.DataOutputStream'
java_import 'java.io.ByteArrayOutputStream'

java_import 'java.io.StringReader'
java_import 'java.io.BufferedReader'

module Libsvm
  class Model
    class << self
      def train(problem, parameter)
        return Svm.svm_train(problem, parameter)
      end
    end

    # Return the SVM problem type for this model
    def svm_type
      self.param.svm_type
    end

    # Return the kernel type for this model
    def kernel_type
      self.param.kernel_type
    end

    # Return the value of the degree parameter
    def degree
      self.param.degree
    end

    # Return the value of the gamma parameter
    def gamma
      self.param.gamma
    end

    # Return the value of the cost parameter
    def cost
      self.param.c
    end

    # Return the number of classes handled by this model.
    def classes
      self.nr_class
    end

    # Save model to given filename.
    # Raises IOError on any error.
    def save filename
      Svm.svm_save_model(filename, self)
    rescue e = java.io.IOException
      raise IOError.new "Error in saving SVM model to file: #{e}"
    end

    # Serialize model and return a string
    def serialize
      stream = ByteArrayOutputStream.new
      do_stream = DataOutputStream.new(stream)
      Svm.svm_save_model(do_stream, self)
      stream.to_s
    rescue java.io.IOException
      raise IOError.new "Error in serializing SVM model"
    end
    def to_s
      serialize
    end

    # Load model from given filename.
    # Raises IOError on any error.
    def self.load filename
      Svm.svm_load_model(filename)
    rescue java.io.IOException
      raise IOError.new "Error in loading SVM model from file"
    end

    # Load model from string.
    def self.load_from_string string
      reader = BufferedReader.new(StringReader.new(string))
      Svm.svm_load_model(reader)
    rescue java.io.IOException
      raise IOError.new "Error in loading SVM model from string"
    end

    def predict(example, &block)
      if block.nil?
        return Svm.svm_predict(self, example)
      else
        prediction, probabilities = predict_probability(example)
        yield probabilities
        return prediction
      end
    end

    def predict_probability(example)
      probabilities = Java::double[self.classes].new
      return Svm.svm_predict_probability(self, example, probabilities), probabilities
    end
  end
end