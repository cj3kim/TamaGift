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

  describe "#get" do
    it "retrieve a gift card object"
  end

  describe "#create" do 
    it "generates a card code"
  end

  describe "#card_value_in_dollars" do
    it "represents the card value in dollars rather than pennies"
  end

  describe "generate_card_code" do
    it "generates a card code by hashing the vendor name and the last gift card sequence number"
  end

end
