require 'profile'

describe Profile do
  context "initially" do
    it "constructs" do
      customer = Profile.new("rachel", "07123456789", "3 house lane")
      expect(customer).to be
    end
  end

  context "When correct information passed to class" do
    it "#name returns name" do
      customer = Profile.new("rachel", "07123456789", "3 house lane")
      expect(customer.name).to eq "Rachel"
    end

    it "#number returns number" do
      customer = Profile.new("rachel", "+4407123456789", "3 house lane")
      expect(customer.number).to eq "+4407123456789"
    end

    it "#address returns address" do
      customer = Profile.new("rachel", "07123456789", "3 house lane")
      expect(customer.address).to eq "3 house lane"
    end
  end
  
  context "If the wrong format of number is entered" do 
    it "#number will format the number and return it" do
      customer = Profile.new("rachel", "07123456789", "3 house lane")
      expect(customer.number).to eq "+4407123456789"
    end
  end
end