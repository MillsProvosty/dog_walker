require 'minitest/autorun'
require 'minitest/pride'
require './lib/dog'
require './lib/walker'
require 'pry'

class WalkerTest < Minitest::Test
  def test_walker_exists
    @Jerimiah = Walker.new("Jerimiah", 10)
    assert_instance_of Walker, @Jerimiah
  end

  def setup
    @Jerimiah = Walker.new("Jerimiah", 10)
    @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    @max = Dog.new("Max", 11, "Cocker Spaniel", false)
    @oscar = Dog.new("Oscar", 2, "Pug", true)
    @daisy = Dog.new("Daisy", 4, "Pug", true)
  end

  def test_clients_default_empty
    assert_equal [], @Jerimiah.clients
  end

  def test_add_clients_returns_clients
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    assert_equal [@sodie, @max], @Jerimiah.clients
  end

  def test_walk_that_dog
    @Jerimiah.walk_that_dog(@sodie)
    assert_equal 9, @Jerimiah.poop_bags
    assert_equal 1, @sodie.walks
  end

  def test_client_number
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    assert_equal 2, @Jerimiah.client_number
  end

  def test_client_elderly?
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    assert_equal false, @Jerimiah.client_elderly?(@sodie)
    assert_equal true, @Jerimiah.client_elderly?(@max)
  end


  def test_list_clients
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    assert_equal ["Sodie", "Max"], @Jerimiah.list_clients
  end

  def test_client_name_ending_in_y_or_ie
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    assert_equal "Sodie", @Jerimiah.client_name_ending
  end

  def test_check_breed
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    assert_equal @max, @Jerimiah.check_breed("Cocker Spaniel")
  end

  def test_list_clients_by_breed
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    @Jerimiah.add_client(@oscar)
    @Jerimiah.add_client(@daisy)

    expected =
      { "Shih-Tzu" => [@sodie],
        "Cocker Spaniel" => [@max],
        "Pug" => [@oscar, @daisy]
      }
    assert_equal expected, @Jerimiah.clients_by_breed
  end

  def test_cant_add_same_client_twice
    @Jerimiah.add_client(@sodie)
    @Jerimiah.add_client(@max)
    @Jerimiah.add_client(@max)
    @Jerimiah.add_client(@oscar)
    @Jerimiah.add_client(@daisy)
    @Jerimiah.add_client(@daisy)
    assert_equal [@sodie, @max, @oscar, @daisy], @Jerimiah.clients
  end
end
