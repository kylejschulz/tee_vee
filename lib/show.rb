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
end
