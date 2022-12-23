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
    if @number[0..2] != "+44" && @number.length == 11
      @number = "+44#{@number}"
    else 
      @number
    end
  end

  def address
    return @address
  end
end