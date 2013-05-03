class GiftCard < ActiveRecord::Base
  belongs_to :user

  attr_accessible :vendor, :card_value, :card_code,
    :recipient_email, :recipient_first_name, :recipient_last_name, :user

  def get
  end

  def create
  end

  def pennies_to_dollars(pennies)
    float_pennies = pennies.to_f #pennies is an integer value
    divisor = 100
    float_pennies / divisor
  end

  def generate_card_code(vendor_name)
    vendor_plus_time = "#{vendor_name} #{Time.now}"
    digest = Digest::MD5.hexdigest(vendor_plus_time)
    update_attribute(:card_code, digest)
  end
end
