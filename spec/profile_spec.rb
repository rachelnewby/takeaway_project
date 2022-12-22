require 'profile'

describe Profile do
  context "initially" do
    it "constructs" do
      customer = Profile.new("rachel", "07123456789", "3 house lane")
      expect(customer).to be
    end
  end

  it "#name returns name" do
    customer = Profile.new("rachel", "07123456789", "3 house lane")
    expect(customer.name).to eq "Rachel"
  end

  it "#number returns name" do
    customer = Profile.new("rachel", "07123456789", "3 house lane")
    expect(customer.number).to eq "07123456789"
  end

  it "#number returns name" do
    customer = Profile.new("rachel", "07123456789", "3 house lane")
    expect(customer.address).to eq "3 house lane"
  end
end