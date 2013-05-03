class CreateGiftCards < ActiveRecord::Migration
  def change
    create_table :gift_cards do |t|
      t.string :vendor
      t.integer :card_value
      t.string :card_code
      t.string :recipient_email
      t.string :recipient_first_name
      t.string :recipient_last_name
      t.references :user

      t.timestamps
    end
  end
end
