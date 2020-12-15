require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'


class NetworkTest < Minitest::Test
  def setup
    @nbc = Network.new("NBC")    # => #<Network:0x00007fe5f83ea3b0...>
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})    # => #<Character:0x00007fe5f88721f8...>
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})    # => #<Character:0x00007fe5f8448f78...>
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])    # => #<Show:0x00007fe5f8398970...>
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})# => #<Character:0x00007fe5f832bb18...>
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})    # => #<Character:0x00007fe5f8172a60...>
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])    # => #<Show:0x00007fe5f88b0a20...>
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})    # => #<Character:0x00007fe5f8448f78...>
    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])    # => #<Show:0x00007fe5f8398970...>
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_has_attributes
    assert_equal "NBC", @nbc.name# => "NBC"
    assert_equal [], @nbc.shows# => []

  end
  def test_it_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_it_can_return_main_characters
    #return  an array of all main characters
    #A character is a main character for the network if
    #their salary is greater than 500_000 and their character
    #name has no lowercase letters.
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal [@kitt], @nbc.main_characters# => [#<Character:0x00007f98a4ba8dc8...>]

  end

  def test_it_can_return_actors_by_show
    #return hash with shows as key, array of names as value

    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    shows = {@knight_rider => ["David Hasselhoff", "William Daniels"],
             @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
            }

  assert_equal shows, @nbc.actors_by_show
  end

  def test_shows_by_actor
    skip
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@baywatch)
    @nbc.add_show(@parks_and_rec)
    actor_hash = {
         "David Hasselhoff" => [@knight_rider, @baywatch],
         "William Daniels" => [@knight_rider],
         "Amy Poehler" => [@parks_and_rec],
         "Nick Offerman" => [@parks_and_rec]
       }
      assert_equal actor_hash, @nbc.shows_by_actor
  end

  def test_most_prolific_actor
    skip
    assert_equal ["David Hasselhoff"], @nbc.prolific_actors# => ["David Hasselhoff"]
  end
end
