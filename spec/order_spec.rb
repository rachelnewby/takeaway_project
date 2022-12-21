require 'order'

describe Order do
  context "initially" do
    it "constructs" do
      menu = double :menu
      customer = double :profile
      order = Order.new(menu, customer)
      expect(order).to be
    end
  end
  
    it "will #verify the order" do
      menu = double :menu
      customer = double :customer
      order = Order.new(menu, customer)
      allow(menu).to receive(:return_item).with('margarita').and_return(["margarita", "£9.50"])
      allow(menu).to receive(:return_item).with('margarita').and_return(["margarita", "£9.50"])
      allow(menu).to receive(:return_item).with('pepperoni').and_return(["pepperoni", "£12.00"])
      order.add('pepperoni')
      order.add('margarita')
      order.add('margarita')
      expect(order.verify).to eq "Pepperoni x 1, Margarita x 2. Total: £31.00"
    end
end