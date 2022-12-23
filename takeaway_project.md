# Takaway Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

# Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

```
┌─────────────────────────┐
│                         │
│            Menu         │
│                         │
├─────────────────────────┤
│                         │
│hash {menu item => price}│
│                         │
├─────────────────────────┤
│                         │
│  view => see the menu   │
│                         │
│                         │
└───────────┬─────────────┘
            │
            │ Order will access prices from
            │  Menu class
            │
            ▼
┌─────────────────────────┐                                ┌─────────────────────────┐
│                         │                                │                         │
│           Order         │                                │    Order Text           │
│                         │                                │                         │
├─────────────────────────┤                                ├─────────────────────────┤
│  initialized with       │                                │ time of the order       │
│   name                  │                                │ placed(?)               │
│  items selected         │                                │ takes a order instance  │
├─────────────────────────┤                                │ via name and order no   │
│ order number =>         ├──────────────────────────────► │                         │
│ generates order num     │    Order text will access      ├─────────────────────────┤
│                         │     time of order, name,       │                         │
│ add => add items to     │     and order number           │ send => sends the text  │
│  array of selected item │                                │  message                │
│                         │                                │                         │
│ verify => print         │                                │                         │
│  itemised reciept with  │                                └─────────────────────────┘
│                  total  │
│time => return time the  │
│order was placed         │
└─────────────────────────┘

```
                                         ┌─────────────────────────┐
                                         │                         │
                                         │            Menu         │
                                         │                         │
                                         ├─────────────────────────┤
                                         │                         │
                                         │hash {menu item => price}│
                                         │                         │
                                         ├─────────────────────────┤
                                         │                         │
                                         │  view => see the menu   │
                                         │                         │
                                         │                         │
                                         └───────────┬─────────────┘
                                                     │
                                                     │ Order will access prices from
                                                     │  Menu class
                                                     │
                                                     ▼
┌──────────────────┐                     ┌─────────────────────────┐                                ┌─────────────────────────┐
│                  │                     │                         │                                │                         │
│    Profile       │                     │           Order         │                                │    Order Text           │
│                  │                     │                         │                                │                         │
├──────────────────┤                     ├─────────────────────────┤                                ├─────────────────────────┤
│ name             │                     │  initialized with       │                                │ time of the order       │
│ phone number     ├────────────────────►│     profile instance    │                                │ placed(?)               │
│ delivery address │                     │  items selected         │                                │ takes a order instance  │
├──────────────────┤     Order will be   ├─────────────────────────┤                                │                         │
│ returns name     │     initialized     │                         ├──────────────────────────────► │                         │
│ returns phone num│     with a profile  │                         │    Order text will access      ├─────────────────────────┤
│                  │     instance        │                         │     time of order, name,       │                         │
│                  │                     │ add => add items to     │     and order number           │ send => sends the text  │
└──────────────────┘                     │  array of selected item │                                │  message                │
                                         │                         │                                │                         │
                                         │ verify => print         │                                │                         │
                                         │  itemised reciept with  │                                └─────────────────────────┘
                                         │                  total  │
                                         │time => return time the  │
                                         │order was placed         │
                                         └─────────────────────────┘
```
```

_Also design the interface of each class in more detail._

```ruby
class Menu
  def initialize
    # ...Hash storing menu items 
  end

  def return_item(string) # string
    # Will search for the item in the string in the menu and return the item and price as array [item, price]
  end

  def view
    # Returns menu list formatted as item with prices on each line, prepended by '*'
  end
end

class Profile(name, phone, address)
  def intialize
    #...
  end

  def name
    # Returns name
  end
  
  def phone_number
    # Returns phone number
  end

  def address
    # Returns address 
  end
end

class Order
  def initialize(profile) #profile is an instance of the Profile class
    #... Customer name 
    #items array to hold the items (starts empty)
  end

  def add(item) # Needs an instance of Menu items 
    # Adds item to array 
    # Returns nothing
  end

  def verify 
    # Returns items ordered with total price using item_totals and price_totals methods
  end

  def confirmed
    # Confirms the order
    # Initilizes OrderText class and calls the send method on it
  end

private 
  def item_totals 
    # Counts the number of times each item in an order appears 
    # Returns the items in the order in a formatted way 
  end

  def price_totals
  #Calculates the total price of the order
  #Returns the total price
end

class OrderText
  def initialize(order, customer) #order is an instance of Order / customer is an instance of Profile 
    #...
  end

  def send
    # Sends text to customer via Twilio
  end

private 
  def order_expected_time
    #Returns the time now plus 30 minutes
  end

end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Verifies what a customer has ordered
menu = Menu.new
customer = Profile.new("rachel", "07123456789", "3 House lane")
order = Order.new(menu, customer)
order.add('pepperoni')
order.add('margarita')
order.verify => "Margarita x 1, Pepperoni x 1. Total: £21.50"

# Verify will return multiple items together 
menu = Menu.new
customer = customer = Profile.new("rachel", ENV["mobile"], "3 House lane")
order = Order.new(menu, customer)
order.add('pepperoni')
order.add('margarita')
order.add('margarita')
order.verify => "Pepperoni x 1, Margarita x 2. Total: £31.00"

# When an 'add'ed item isn't an option 
menu = Menu.new
customer = customer = Profile.new("rachel", ENV["mobile"], "3 House lane")
order = Order.new(menu, customer)
order.add('pork') => "Error: pork not an option"

# When an 'add'ed item isn't an option but other items were valid: #verify will still work on valid items
menu = Menu.new
customer = customer = Profile.new("rachel", ENV["mobile"], "3 House lane")
order = Order.new(menu, customer)
order.add('pepperoni')
expect(order.add('pork')).to eq "Error: pork not an option"
order.verify => "Pepperoni x 1. Total: £12.00"

# When #verify is called but nothing has been added to order
menu = Menu.new
customer = customer = Profile.new("rachel", ENV["mobile"], "3 House lane")
order = Order.new(menu, customer)
order.verify => "Error: nothing has been added to your order"

# When #confirmed is called but nothing has been added to order
menu = Menu.new
customer = Profile.new("rachel", ENV["mobile"], "3 House lane")
order = Order.new(menu, customer)
expect{order.confirmed}.to raise_error "ERROR: There are no items in your order"

# Once order is confirmed text message sent 
menu = Menu.new
customer = Profile.new("rachel", "07123456789", "3 House lane")
order = Order.new(menu, customer)
order.add('pepperoni')
order.add('margarita')
order.confirmed
text = OrderText.new(order)
expect(text.send).to eq "" #Not sure how to write this yet! 

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# MENU UNIT TEST

# It constructs a new menu
menu = Menu.new
expect(menu).to be
 
# It return_item when details of the item are passed a string argument
menu = Menu.new
menu.return_item('margarita') => ["margarita", "£9.50"]

# It returns nil if string isn't on the menu       
menu = Menu.new
menu.return_item('pork') => nil

# iew formats the menu and returns it for customer to read
menu = Menu.new
menu.view => [
  "* margarita: £9.50",
  "* pepperoni: £12.00", 
  "* spicy beef: £13.50",
  "* spinach & egg: £11.00",
  "* ham & mushroom: £11.50",
  "* meat muncher: £14.50"
]

# PROFILE UNIT TEST

# It constructs a new Profile class      
customer = Profile.new("rachel", "07123456789", "3 house lane")
expect(customer).to be

# It returns name 
customer = Profile.new("rachel", "07123456789", "3 house lane")
customer.name => "Rachel"

# It returns number
customer = Profile.new("rachel", "+4407123456789", "3 house lane")
customer.number => "+4407123456789"

# It returns address
customer = Profile.new("rachel", "07123456789", "3 house lane")
customer.address => "3 house lane"

# It corrects the format of the number if the number inputted isn't compatable with Twilio
customer = Profile.new("rachel", "07123456789", "3 house lane")
customer.number => "+4407123456789"

# ORDER UNIT TEST

# It constructs an Order class
menu = double :menu
customer = double :profile
order = Order.new(menu, customer)
expect(order).to be

# It verifies the order
menu = double :menu
customer = double :customer
order = Order.new(menu, customer)
allow(menu).to receive(:return_item).with('margarita').and_return(["margarita", "£9.50"])
allow(menu).to receive(:return_item).with('margarita').and_return(["margarita", "£9.50"])
allow(menu).to receive(:return_item).with('pepperoni').and_return(["pepperoni", "£12.00"])
order.add('pepperoni')
order.add('margarita')
order.add('margarita')
order.verify => "Pepperoni x 1, Margarita x 2. Total: £31.00"

# When an item 'add'ed doesn't exist a message is displayed
menu = double :menu
customer = double :customer
order = Order.new(menu, customer)
allow(menu).to receive(:return_item).with('pork').and_return(nil)
order.add('pork') => "Error: pork not an option"

# When verify is called on an empty order
menu = double :menu
customer = double :customer
order = Order.new(menu, customer)
order.verify => "Error: nothing has been added to your order"

# When confirmed is called on an empty order
menu = double :menu
customer = double :customer
order = Order.new(menu, customer)
order.confirmed => "ERROR: There are no items in your order"

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._