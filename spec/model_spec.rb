require "spec_helper"

describe Model do
  def create_example
    Node.features(0.2, 0.3, 0.4, 0.5)
  end

  def create_problem
    problem = Problem.new
    features = [Node.features([0.2,0.3,0.4,0.4]),
                Node.features([0.1,0.5,0.1,0.9]),
                Node.features([0.2,0.2,0.6,0.5]),
                Node.features([0.3,0.1,0.5,0.9])]
    problem.set_examples([1,2,1,2], features)
    problem
  end

  def create_parameter
    parameter = Parameter.new
    parameter.cache_size = 50 # mb
    parameter.eps = 0.01
    parameter.c = 10
    parameter.probability = 1
    parameter
  end

  context "The class interface" do
    before(:each) do
      @problem = create_problem
      @parameter = create_parameter
    end

    it "results from training on a problem under a certain parameter set" do
      model = Model.train(@problem,@parameter)
      model.should_not be_nil
    end
  end

  context "A saved model" do
    before(:each) do
      @filename = "tmp/svm_model.model"
      model = Model.train(create_problem, create_parameter)
      model.save(@filename)
    end

    it "can be loaded" do
      model = Model.load(@filename)
      model.should_not be_nil
    end

    after(:each) do
      File.delete(@filename) rescue nil
    end
  end

  context "An Libsvm model" do
    before(:each) do
      @problem = create_problem
      @parameter = create_parameter
      @model = Model.train(@problem, @parameter)
      @file_path = "tmp/svm_model.model"
      File.delete(@file_path) if File.exists?(@file_path)
    end

    it "can be saved to a file" do
      @model.save(@file_path)
      File.exist?(@file_path).should be_true
    end

    it "can be asked for it's svm_type" do
      @model.svm_type.should == Parameter::C_SVC
    end

    it "can be asked for it's number of classes (aka. labels)" do
      @model.classes.should == 2
    end

    it "can predict" do
      prediction = @model.predict(create_example)
      prediction.should_not be_nil
    end
    it "can predict probability" do
      prediction, probabilities = @model.predict_probability(create_example)
      prediction.should_not be_nil
      probabilities.each { |e| e.should_not be_nil }
    end
    it "can predict probability with nil array" do
      prediction = @model.predict(create_example) do |probabilities|
        probabilities.should be_all { |p| p.kind_of? Float }
        probabilities.count.should == @model.classes
      end
      prediction.should be_a Float
    end
  end
end