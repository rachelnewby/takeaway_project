require 'profile'
require 'order'
require 'order_text'
require 'menu'

describe "Integration" do
  context "When a new order is placed" do
    it "#verify returns order and total" do
      menu = Menu.new
      customer = Profile.new("rachel", "07123456789", "3 House lane")
      order = Order.new(menu, customer)
      order.add('pepperoni')
      order.add('margarita')
      expect(order.verify).to eq "Pepperoni x 1, Margarita x 1. Total: £21.50"
    end

    it "will #verify the order" do
      menu = Menu.new
      customer = customer = Profile.new("rachel", "07123456789", "3 House lane")
      order = Order.new(menu, customer)
      order.add('pepperoni')
      order.add('margarita')
      order.add('margarita')
      expect(order.verify).to eq "Pepperoni x 1, Margarita x 2. Total: £31.00"
    end
  end
  context "When an item 'added' doesn't exist" do
    it "#add will return error message" do
      menu = Menu.new
      customer = customer = Profile.new("rachel", "07123456789", "3 House lane")
      order = Order.new(menu, customer)
      order.add('pepperoni')
      expect(order.add('pork')).to eq "Error: pork not an option"
      expect(order.verify).to eq "Pepperoni x 1. Total: £12.00"
    end
  end
  context "When an item 'added' doesn't exist" do
    it "#add will return error message" do
      menu = Menu.new
      customer = customer = Profile.new("rachel", "07123456789", "3 House lane")
      order = Order.new(menu, customer)
      expect(order.add('pork')).to eq "Error: pork not an option"
    end
  end
  context "Nothing has been added to the order" do
    it "#verify will return error message" do
      menu = Menu.new
      customer = customer = Profile.new("rachel", "07123456789", "3 House lane")
      order = Order.new(menu, customer)
      expect(order.verify).to eq "Error: nothing has been added to your order"
    end
  end
end

