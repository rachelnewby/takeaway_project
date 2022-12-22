class Profile
  def initialize(name, number, address)
    @name = name
    @number = number
    @address = address
  end

  def name
    return @name.capitalize
  end

  def number
    return @number
  end

  def address
    return @address
  end
end