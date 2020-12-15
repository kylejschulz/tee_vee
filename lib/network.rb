class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end



  def main_characters
    all_characters = []
    @shows.each do |show|
        all_characters << show.show_main_characters
      end
    all_characters.flatten
  end

  def all_characters
    all_characters = []
    @shows.each do |show|
      all_characters << show.characters
    end
    all_characters

  end

  def actors_by_show
    new_hash = Hash.new { |h, k| h[k] = [] }
    shows.each do |show|
      char_array = []
      show.characters.each do |char|
        char_array << char.actor
      end
      new_hash[show].push(char_array).flatten!

    end
    new_hash
  end




  # def shows_by_actor
  #   new_hash = Hash.new { |h, k| h[k] = [] }
  #   @shows.each do |show|
  #
  #   end
  # end

  # def actors_by_show
  #   actors = Hash.new
  #   all_characters.group_by do |character|
  #
  #     actors[character.show] = character.name
  #   end
  #   actors
  # end

  # def actors_by_show
  #   new_hash = Hash.new { |h, k| h[k] = [] }
  #   @shows.each do |show|
  #     new_hash[show].push(show.characters.name)
  #   end
  #   new_hash
  # end


end
