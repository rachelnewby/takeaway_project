class Menu
  def initialize 
    @menu_items = [
      {item: "margarita", price: "£9.50"},
      {item: "pepperoni", price: "£12.00"}, 
      {item: "spicy beef", price: "£13.50"},
      {item: "spinach & egg", price: "£11.00"},
      {item: "ham & mushroom", price: "£11.50"},
      {item: "meat muncher", price: "£14.50"}
  ]
  end

  def return_item(string) 
    @menu_items.each { |item| return [item[:item], item[:price]] if item[:item] == string.downcase }
  end

  def view
    formatted_items = []
    @menu_items.each { |item| formatted_items << "* #{item[:item]}: #{item[:price]}" }
    return formatted_items
  end
end
