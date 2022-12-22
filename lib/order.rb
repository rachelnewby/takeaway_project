require 'active_support'
require 'date'

class Order
  def initialize(menu, customer)
    @menu = menu
    @customer = customer
    @ordered_items = []
    @confirmed = false
  end

  def add(item)
    return "Error: #{item} not an option" if @menu.return_item(item) == nil  
    @ordered_items << @menu.return_item(item) 
  end

  def verify
    return "Error: nothing has been added to your order" if @ordered_items == []
    item_totals = self.item_totals
    price_total = self.price_totals
    return "#{item_totals}. Total: £#{price_total}0"
  end

  def confirmed
    @confirmed = true
    text = OrderText.new(self, @customer)
    text.send
  end

  private

  def item_totals
    all_items = Hash.new(0)
    formatted_items = []
    @ordered_items.flatten.each { |item| all_items[item] += 1 unless item[0] == "£" }
    all_items.each {|k, v| formatted_items << "#{k.capitalize} x #{v}" }
    item_totals = formatted_items.join(", ")
  end

  def price_totals
    all_numbers = []
    @ordered_items.flatten.each { |item| all_numbers << item[1..-1].to_f if item[0] == "£" }
    price_total = all_numbers.inject(:+)
  end
end 


