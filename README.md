# jrb-libsvm

[![Build Status](https://travis-ci.org/sch1zo/jrb-libsvm.png?branch=master)](undefined)

This jruby gem exposes more or less exactly the same interface as [rb-libsvm][].
Goal was to make them as interchangeable as possible.

This package provides a Ruby bindings to the [LIBSVM][] library.  SVM
is a machine learning and classification algorithm, and LIBSVM is a
popular free implementation of it, written by Chih-Chung Chang and
Chih-Jen Lin, of National Taiwan University, Taipei. See the book ["Programming
Collective Intelligence,"](http://books.google.com/books?id=fEsZ3Ey-Hq4C) among others, for a usage example.

LIBSVM includes a number of command line tools for preprocessing
training data and finding parameters. These tools are not included in
this gem. You should install the original package if you need them.

It is helpful to consult the [README][] of the LIBSVM package for
reference when configuring the training parameters.

## Java Libary

Currently this package includes a modified version of libsvm version
3.16.

- proper Java class names, e.g. svm_model -> Model
- overloaded `svm_save_model` to be able to save to any DataOutputStream e.g. a String
- supress all info output written to STDOUT

This gem also includes v.3.11 sources which have a Model which provides value of w-squared for hyperplane.
These can be found in `java/3-11_w_squared/Svm.java`, to use it just move it into the libsvm folder
and recompile the jar (`rake compile`).

## Dependencies

None.  LIBSVM is bundled with the project.  Just install and go!

## Installation

Add this line to your application's Gemfile:

    gem 'jrb-libsvm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jrb-libsvm

## Usage

This is a short example of how to use the gem.

```ruby
require 'jrb-libsvm'

# This library is namespaced.
problem = Libsvm::Problem.new
parameter = Libsvm::Parameter.new

parameter.cache_size = 1 # in megabytes

parameter.eps = 0.001
parameter.c = 10

examples = [ [1,0,1], [-1,0,-1] ].map {|ary| Libsvm::Node.features(ary) }
labels = [1, -1]

problem.set_examples(labels, examples)

model = Libsvm::Model.train(problem, parameter)

pred = model.predict(Libsvm::Node.features(1, 1, 1))
puts "Example [1, 1, 1] - Predicted #{pred}"
```

## License

This software can be freely used under the terms of the MIT license,
see file MIT-LICENSE.

This package includes the source of LIBSVM, which is free to use under
the license in the file LIBSVM-LICENSE.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[libsvm]:       http://www.csie.ntu.edu.tw/~cjlin/libsvm/

[svmrubyswig]:  http://github.com/tomz/libsvm-ruby-swig/tree/master

[ruby-svm]:     http://sourceforge.net/projects/rubysvm/

[README]:       https://github.com/febeling/libsvm/blob/master/README

[rb-libsvm]:    https://github.com/febeling/rb-libsvm
