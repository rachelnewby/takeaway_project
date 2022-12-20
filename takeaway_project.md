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
├──────────────────┤     Order will be   ├─────────────────────────┤                                │ via name and order no   │
│ returns name     │     initialized     │ order number =>         ├──────────────────────────────► │                         │
│ returns phone num│     with a profile  │ generates order num     │    Order text will access      ├─────────────────────────┤
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

  def view(diet)
    # Returns menu list formatted as item with prices on each line, prepended by '*'
    #COULD DO THIS AS A FILTER - VEGETARIAN, VEGAN, MEAN OR FISH - and have a hash of hashes? KEY COULD BE A NUMBER OF THE DISH?
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
    # Confirms order placed - runs OrderText
    # Returns items ordered with total price
  end

  def time
    # Returns the time that the order was placed
  end
end

class OrderText
  def initialize(order) #order is an instance of Order
    #...
  end

  def send
    # Sends text to customer via Twilio
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# 


# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._