class GiftCard < ActiveRecord::Base
  belongs_to :user
  before_create :convert_card_value_to_pennies
  after_create :generate_card_code

  attr_accessible :vendor, :card_value, :card_code, :description,
    :recipient_email, :recipient_first_name, :recipient_last_name, :user

  def convert_card_value_to_pennies
    self.card_value = dollars_to_pennies(self.card_value)
  end

  def pennies_to_dollars(pennies)
    float_pennies = pennies.to_f #pennies is an integer value
    divisor = 100
    float_pennies / divisor
  end

  def dollars_to_pennies(dollars)
    float_dollars = dollars.to_f
    multiplier = 100
    pennies = float_dollars * multiplier
    pennies.to_i
  end

  def generate_card_code
    vendor_name_plus_time = "#{self.vendor} #{Time.now}"
    digest = Digest::MD5.hexdigest(vendor_name_plus_time)
    update_attribute(:card_code, digest)
  end
end
