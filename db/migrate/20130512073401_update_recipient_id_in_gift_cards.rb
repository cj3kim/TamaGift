class UpdateRecipientIdInGiftCards < ActiveRecord::Migration
  def up
    execute "UPDATE gift_cards AS g SET recipient_id = r.id FROM recipients AS r WHERE g.recipient_email = r.email;"
  end

  def down
    execute "UPDATE gift_cards SET recipient_id = null;"
  end
end
