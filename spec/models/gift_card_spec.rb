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

      pennies = "4050"
      dollars = 40.5
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = "4000"
      dollars = 40.0
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

      pennies = 40
      dollars = 0.40
      starbucks_gift_card.pennies_to_dollars(pennies).should == dollars

    end
  end

  describe "dollars_to_pennies" do
    it "returns and integer representation of dollars in pennies" do
      dollars = "10.53"
      pennies = 1053

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = 20.23
      pennies = 2023

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = 19.0
      pennies = 1900

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = "19.0"
      pennies = 1900

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = 0.04
      pennies = 4

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

      dollars = ".04"
      pennies = 4

      turtle_gift_card.dollars_to_pennies(dollars).should == pennies
      turtle_gift_card.dollars_to_pennies(dollars).class.should == Fixnum

    end
  end

  describe "#generate_card_code" do
    it "generates a card code and updates the card_code attribute" do
      current_time_one = Time.parse "2013-05-03 12:00:00 -0700"
      current_time_two = Time.parse "2013-05-04 12:23:00 -0700" 
      vendor_name = turtle_gift_card.vendor

      Time.stub(:now).and_return(current_time_one)
      card_code = "99bc73644c17d98f680f61de3c1de49e"
      turtle_gift_card.generate_card_code

      turtle_gift_card.card_code.should == card_code

      Time.stub(:now).and_return(current_time_two)
      card_code = "3118172111dacf9cae5cbfcb79da02e3"
      turtle_gift_card.generate_card_code

      turtle_gift_card.card_code.should == card_code
    end
  end
end
