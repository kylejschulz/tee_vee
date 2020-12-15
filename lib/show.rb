class Show
  attr_reader :name, :creator, :characters
  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    sum = 0
    @characters.each do |character|
      sum += character.salary
    end
    sum
  end

  def highest_paid_actor
    highest_paid = @characters.max_by do |character|
      character.salary
    end
    highest_paid.actor
  end

  def actors
    all_actors = []
    @characters.each do |character|
      all_actors << character.actor
    end
    all_actors
  end

  def show_main_characters
    main_chars = @characters.select do |char|
      char.main_character
    end
    main_chars
  end

#     names = ["Khloe", "Kim", "Kris", "Kourtney"]
#     greatest = names.max_by do |name|
#       name.length
#     end

end
