require 'spec_helper'

describe GiftCard do
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

  describe "#after_create" do 
    context "when a gift card is created" do
      it "generates a card code" do
        gift_card = GiftCard.new(vendor: "Sushi")

        gift_card.card_code.should == nil

        gift_card.save

        gift_card.card_code.class.should == String
      end
    end
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
      current_time = Time.now
      vendor_name = turtle_gift_card.vendor

      #Stubbing Time.now makes update_attribute to error 

      number_string = "12345"
      number_string.should_receive(:utc).and_return(current_time)
      Time.stub(:now).and_return(number)
      card_code = "8804907b912e0de01d8f336f39ec02ee"

      turtle_gift_card.generate_card_code

      turtle_gift_card.card_code.should == card_code

      number_string = "54321"
      number_string.should_receive(:utc).and_return(current_time)
      Time.stub(:now).and_return(number)
      card_code = "a9566f704ad504c8c98dae9c5bf7e212"

      turtle_gift_card.generate_card_code

      turtle_gift_card.card_code.should == card_code
    end
  end
end
