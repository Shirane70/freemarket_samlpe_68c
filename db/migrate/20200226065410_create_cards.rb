class CreateCards < ActiveRecord::Migration[5.2]
def change
  create_table :cards do |t|
    t.integer :user_id,         foreign_key: true, null: false
    t.string :customer_id,     null: false
    t.string :card_id

    end
  end
end
