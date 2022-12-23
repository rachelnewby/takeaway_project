require 'menu'

describe Menu do
  context "initially" do
    it "constructs" do
      menu = Menu.new
      expect(menu).to be
    end
  end

  it "#return_item returns the details of the item in the string passed as arguement" do
    menu = Menu.new
    expect(menu.return_item('margarita')).to eq ["margarita", "£9.50"]
  end

  context "If an item passed to #return_item isn't on the menu" do
    it "#return_item will return nil" do
      menu = Menu.new
      expect(menu.return_item('pork')).to eq nil
    end
  end

  it "#view formats the menu and returns it for customers to read" do
    menu = Menu.new
    expect(menu.view).to eq [
      "* margarita: £9.50",
      "* pepperoni: £12.00", 
      "* spicy beef: £13.50",
      "* spinach & egg: £11.00",
      "* ham & mushroom: £11.50",
      "* meat muncher: £14.50"
    ]
  end
end