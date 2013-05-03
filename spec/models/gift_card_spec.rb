require 'spec_helper'

describe GiftCard do
  let(:user_one) do 
    FactoryGirl.create(:user, 
                       email: "starbucks_fiend@gmail.com",
                       first_name: "Keitaro",
                       last_name:"Urashima") 
  end

  let(:starbucks_gift_card) do 
    FactoryGirl.create(:gift_card,
                       vendor: "Starbucks",
                       card_value: 2000,
                       card_code: nil ,
                       recipient_email: "narusegawa@tokyo.edu",
                       recipient_first_name: "Naru",
                       recipient_last_name: "Narusegawa")
  end

  let(:turtle_gift_card) { FactoryGirl.create(:gift_card, vendor: "Tamaland", card_value: 2000) }

  describe "#get" do
    it "retrieve a gift card object"
  end

  describe "#create" do 
    it "generates a card code"
  end

  describe "#pennies_to_dollars" do
    it "returns a float representation of pennies in dollars" do
      pennies = 5000
      dollars = 50.0
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = 2012
      dollars = 20.12
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = 3050
      dollars = 30.5
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars
    end
  end

  describe "#generate_card_code" do
    it "generates a card code and updates the card_code attribute" do
      vendor_name = turtle_gift_card.vendor
      Time.stub(:now).and_return("12345")
      card_code = "8804907b912e0de01d8f336f39ec02ee"

      turtle_gift_card.card_code.should == nil
      turtle_gift_card.generate_card_code(vendor_name)
      turtle_gift_card.card_code.should_not == nil
      turtle_gift_card.card_code.should == card_code

      Time.stub(:now).and_return("54321")
      card_code = "a9566f704ad504c8c98dae9c5bf7e212"

      turtle_gift_card.generate_card_code(vendor_name)
      turtle_gift_card.card_code.should_not == nil
      turtle_gift_card.card_code.should == card_code
    end
  end

end
