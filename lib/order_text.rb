require 'twilio-ruby'
require 'dotenv' 
Dotenv.load('file_1.env')

class OrderText 
  def initialize(order, customer)
    @order = order
    @customer = customer
  end

  def send
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV["twilio_number"] 
    to = @customer.number

    client.messages.create(
    from: from,
    to: to,
    body: "Hi #{@customer.name}. Your order will be ready at #{self.order_expected_time}."
    )
  end

  private

  def order_expected_time
    time = Time.new
    order_expected_time = time + 1800
    formatted_time = order_expected_time.strftime("%a %d %b, %Y %H:%M")
  end
end