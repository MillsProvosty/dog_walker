require 'minitest/autorun'
require 'minitest/pride'
require './lib/dog'

class DogTest < Minitest::Test
  def test_dog_exists
    @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    assert_instance_of Dog, @sodie
  end

  def setup
    @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    @max = Dog.new("Max", 11, "Cocker Spaniel", false)
  end

  def test_dogs_have_attributes
    assert_equal "Sodie", @sodie.name
    assert_equal 9, @sodie.age
    assert_equal "Shih-Tzu", @sodie.breed
    assert_equal true, @sodie.small_breed
  end

  def test_walks_default_0
    assert_equal 0, @sodie.walks
  end

  def test_bark_returns_yap_or_roof
    assert_equal "Yap!", @sodie.bark
    assert_equal "ROOF", @max.bark
  end

  def test_walk_adds_number_to_walks
    @sodie.walk
    assert_equal 1, @sodie.walks
    @sodie.walk
    assert_equal 2, @sodie.walks
  end
end
