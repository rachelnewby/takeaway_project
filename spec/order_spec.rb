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
  
  context "When an item 'added' doesn't exist" do
    it "#add will return error message" do
      menu = double :menu
      customer = double :customer
      order = Order.new(menu, customer)
      allow(menu).to receive(:return_item).with('pork').and_return(nil)
      expect(order.add('pork')).to eq "Error: pork not an option"
    end
  end
  context "Nothing has been added to the order" do
    it "#verify will return error message" do
      menu = double :menu
      customer = double :customer
      order = Order.new(menu, customer)
      expect(order.verify).to eq "Error: nothing has been added to your order"
    end

    it "#confirmed will throw an error" do
      menu = double :menu
      customer = double :customer
      order = Order.new(menu, customer)
      expect{order.confirmed}.to raise_error "ERROR: There are no items in your order"
    end
  end
end


#Need a test to double the time function so I can test that it will work (review what we did the other day - it was an example)