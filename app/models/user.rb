class User < ActiveRecord::Base
  has_many :gift_cards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :dob, :first_name, :last_name

  def count_of_gift_cards
    GiftCard.count(conditions: "user_id = #{self.id}")
  end
end
