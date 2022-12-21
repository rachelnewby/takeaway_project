require 'profile'

describe Profile do
  context "initially" do
    it "constructs" do
      customer = Profile.new("rachel", "07123456789", "3 house lane")
      expect(customer).to be
    end
  end
end