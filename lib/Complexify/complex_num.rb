module Math
  module Complexify
    class Complex
      attr_accessor :real
      attr_accessor :imaginary
      def initialize(real, imaginary)
        # when Math::Complexify.new is called, initialize
        # is run after the object is instantiated
        @real = real
        @imaginary = imaginary
      end

      def addition(z)
        # adds the real part of z to the real part of the calling method
        # also adds the imaginary parts and returs the result
        Math::Complexify::Complex.new(@real + z.real, @imaginary + z.imaginary)
      end

      def subtraction(z)
        # adds the real part of z to the real part of the calling method
        # also adds the imaginary parts and returs a new Math::Complexify::Complex instance
        Math::Complexify::Complex.new(@real - z.real, @imaginary - z.imaginary)
      end

      def multiplication(z)
        z = complexChecker(z)
        n_real = (@real * z.real) - (@imaginary * z.imaginary)
        n_imag = (@real * z.imaginary) + (@imaginary * z.real)
        Math::Complexify::Complex.new(n_real, n_imag)
      end

      def division(z)
        z = complexChecker(z)
        coef = (z.imaginary**2 + z.real**2)
        n_real = (@imaginary * z.imaginary + @real * z.real) / coef
        n_imag = (-@real * z.imaginary + @imaginary * z.real) / coef
        Math::Complexify::Complex.new(n_real, n_imag)
      end

      def complexChecker(z)
        if z.is_a? Math::Complexify::Complex
          #do nothing if the argument is already of type Complex!
          return z
        else
          #else, make it a type Complex and make its imaginary part = 0
          return Math::Complexify::Complex.new(z, 0)
        end
      end

      def to_s
        # the to_s function outputs a string automatically, for example:
        # suppose z is an object of type complex Number, then
        # puts z     will implicitly call z.to_s and then output the result
        output = if @imaginary == 0
                   "#{@real}"
                 elsif @real == 0
                   "#{@imaginary}i"
                 elsif @imaginary == 1
                   "#{@real} + i"
                 elsif @imaginary > 1
                   "#{@real} + #{@imaginary}i"
                 elsif @imaginary == -1
                   "#{@real} - i"
                 else
                   "#{@real} - #{-1 * @imaginary}i"
                 end
        output # return the string
      end
    end
  end
end

num_1 = Math::Complexify::Complex.new(5, 8)
num_2 = Math::Complexify::Complex.new(-5, 6)

num_3 = num_1.addition(num_2)
num_4 = num_1.subtraction(num_2)
num_5 = num_1.multiplication(num_2)
num_6 = num_1.division(num_2)

puts num_3
puts num_4
puts num_5
puts num_6