class CreateRecipientToPmLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :recipient_to_pm_links do |t|

      t.timestamps
    end
  end
end
