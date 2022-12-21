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