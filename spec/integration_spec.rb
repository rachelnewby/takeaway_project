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
  end
end

