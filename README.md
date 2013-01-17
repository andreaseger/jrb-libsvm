# Jrb::Libsvm

**TODO: travis link**

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

Currently this package includes a modified version of libsvm version 3.14.

- proper Java class names, e.g. svm_model -> Model
- overloaded `svm_save_model` to be able to save to any DataOutputStream e.g. a String

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

TODO: Write usage instructions here

## License

This software can be freely used under the terms of the MIT license,
see file MIT-LICENSE.

This package includes the source of LIBSVM, which is free to use under
the license in the file LIBSVM-LICENSE.

## Posts about using SVMs with Ruby

http://neovintage.blogspot.com/2011/11/text-classification-using-support.html

http://www.igvita.com/2008/01/07/support-vector-machines-svm-in-ruby/

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