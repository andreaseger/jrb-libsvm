module Libsvm
  class Problem
    def set_examples(labels, features)
      unless features.size == labels.size
        raise ArgumentError.new "Number of features must equal number of labels"
      end
      unless features.size > 0
        raise ArgumentError.new "There must be at least one feature."
      end
      unless features.collect {|i| i.size}.min == features.collect {|i| i.size}.max
        raise ArgumentError.new "All features must have the same size"
      end

      self.l = labels.size
      # -- add in the training data
      self.x = Node[features.size, features[0].size].new
      features.each.with_index do |feature, i|
        feature.each.with_index do |node, j|
          self.x[i][j] = node
        end
      end

      # -- add in the labels
      self.y = Java::double[labels.size].new
      labels.each.with_index do |label, i| 
        self.y[i] = label
      end

      return self
    end
    def examples
      return self.y, self.x
    end
  end
end