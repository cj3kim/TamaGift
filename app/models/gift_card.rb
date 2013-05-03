class GiftCard < ActiveRecord::Base
  belongs_to :user
  after_create :generate_card_code

  attr_accessible :vendor, :card_value, :card_code,
    :recipient_email, :recipient_first_name, :recipient_last_name, :user

  def pennies_to_dollars(pennies)
    float_pennies = pennies.to_f #pennies is an integer value
    divisor = 100
    float_pennies / divisor
  end

  def generate_card_code
    vendor_name_plus_time = "#{self.vendor} #{Time.now}"
    digest = Digest::MD5.hexdigest(vendor_name_plus_time)
    update_attribute(:card_code, digest)
  end
end
