class Character
  attr_reader :name, :actor, :salary
  def initialize(args)
    @name = args[:name]
    @actor = args[:actor]
    @salary = args[:salary]
  end

  def main_character
    @salary > 500_000 && (@name == @name.upcase)
  end

end
