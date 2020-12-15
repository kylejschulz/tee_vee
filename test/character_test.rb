require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'

class CharacterTest < Minitest::Test
  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})    # => #<Character:0x00007f98a4ba8dc8...>
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})# => #<Character:0x00007f8327213de0...>

  end

  def test_it_exists
    assert_instance_of Character, @kitt
  end

  def test_it_has_attributes
    assert_equal "KITT", @kitt.name# =>
    assert_equal "William Daniels", @kitt.actor# =>
    assert_equal 1000000, @kitt.salary# =>
  end
  def test_it_can_return_main_characters
    assert_equal false, @michael_knight.main_character
    assert_equal true, @kitt.main_character
  end
end
