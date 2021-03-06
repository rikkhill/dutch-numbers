require 'test/unit'
require_relative '../lib/dutch'

# Tests for Dutch Integers

# We can check this object satisfies the axioms for
# a ring over the integers

class TestIntegerRing < Test::Unit::TestCase

  def setup
    @zero = Dint.new(0)
    @one = Dint.new(1)
    @two = Dint.new(2)
    @five = Dint.new(5)
    @ten = Dint.new(10)
    @sixtysix = Dint.new(66)
    @twohundred = Dint.new(200)

    @neg_one = Dint.new(1, false)
    @neg_two = Dint.new(2, false)
    @neg_five = Dint.new(5, false)
    @neg_ten = Dint.new(10, false)
  end

  # ADDITION

  def test_addition_identity
    assert_equal(@zero + @zero, @zero, 'Zero is identity under addition for 0')
    assert_equal(@one + @zero, @one, 'Zero is identity under addition for 1')
    assert_equal(@ten + @zero, @ten, 'Zero is identity under addition for 10')
    assert_equal(@twohundred + @zero, @twohundred, 'Zero is additive identity under addition for 200')
  end

  def test_positive_addition
    assert_equal(@one + @one, @two, 'One plus one is two')
    assert_equal(@two + @two, Dint.new(4), 'Two plus two is four')
    assert_equal(@ten + @ten, Dint.new(20), 'Ten plus ten is twenty')
  end

  def test_negative_addition
    assert_equal(@neg_one + @neg_one, @neg_two, '-1 + -1 = -2')
    assert_equal(@neg_two + @neg_two, Dint.new(-4), '-2 + -2 = -4')
    assert_equal(@neg_five + @neg_five, @neg_ten, '-5 + -5 = -10')
  end

  def test_mixed_sign_addition
    assert_equal(@neg_one + @two, @one, '-1 + 2 = 1')
    assert_equal(@neg_two + @one, @neg_one, '-2 + 1 = -1')
    assert_equal(@neg_five + @five, @zero, '-5 + 5 = 0')
  end

  def test_addition_associativity
    # This should hold for all n in Z, but lets just test this one...
    assert_equal((@one + @two) + @five, @one + (@two + @five), 'Additive associativity holds')
  end

  # SUBTRACTION

  def test_subtraction
    assert_equal(@ten - @five, @five, '10 - 10 = 5')
    assert_equal(@neg_ten - @neg_five, @neg_five, '-10 - -5 = -5')
    assert_equal(@five - @ten, @neg_five, '5 - 10 = -5')
  end

  # MULTIPLICATION

  def test_multiplicative_identity
    assert_equal(@one * @zero, @zero, 'One is identity under multiplication for 0')
    assert_equal(@one * @one, @one, 'One is identity under multiplication for 1')
    assert_equal(@ten * @one, @ten, 'One is identity under multiplication for 10')
    assert_equal(@twohundred * @one, @twohundred, 'One is identity under multiplication for 200')
  end

  def test_positive_multiplication
    assert_equal(@five * @five, Dint.new(25), '5 * 5 = 25')
    assert_equal(@two * @two, Dint.new(4), '2 * 2 = 4')
    assert_equal(@ten * @ten, Dint.new(100), '10 * 10 = 100')
  end

  def test_negative_multiplication
    assert_equal(@neg_one * @neg_one, @one, '-1 * -1 = 1')
    assert_equal(@neg_two * @neg_two, Dint.new(4), '-2 * -2 = 4')
    assert_equal(@neg_five * @neg_five, Dint.new(25), '-5 * -5 = 25')
  end

  def test_mixed_sign_multiplication
    assert_equal(@neg_one * @two, @neg_two, '-1 * 2 = -2')
    assert_equal(@neg_two * @five, @neg_ten, '-2 * 5 = -10')
    assert_equal(@neg_five * @five, Dint.new(25, false), '-5 * 5 = -25')
  end

  def test_multiplication_associativity
    # This should hold for all n in Z, but lets just test this one...
    assert_equal((@one * @two) * @five, @one * (@two * @five), 'multiplicative associativity holds')
  end

  def test_division_basic
    assert_equal(@five / @five, @one, '5 / 5 = 1')
    assert_equal(@ten / @five, @two, '10 / 5 = 2')
    assert_equal(@ten / @two, @five, '10 / 2 = 5')
    assert_equal(@two / @ten, @zero, '10 / 2 = 5')
    assert_equal(@ten / @neg_two, @neg_five, '10 / -2 = -5')
    assert_equal(@neg_ten / @neg_two, @five, '-10 / -2 = 5')
    assert_equal((@ten - @ten - @ten) / @neg_two, @five, '(-5 + -5) / -2 = 5')
  end

end

class TestComparable < Test::Unit::TestCase

  def setup
    @zero = Dint.new(0)

    @one = Dint.new(1)
    @two = Dint.new(2)
    @five = Dint.new(5)
    @ten = Dint.new(10)

    @neg_one = Dint.new(1, false)
    @neg_two = Dint.new(2, false)
    @neg_five = Dint.new(5, false)
    @neg_ten = Dint.new(10, false)
  end

  def test_less_than
    assert(@one < @two, 'one is less than two, positive')
    assert(@neg_two < @neg_one, '-2 < -1, negative')
    assert(@neg_two < @one, '-2 < 1, mixed sign')
  end

end
