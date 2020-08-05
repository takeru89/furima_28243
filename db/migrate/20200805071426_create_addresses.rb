class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :dealing,       null: false, foreign_key: true
      t.string     :postal_code,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :block_num,     null: false
      t.string     :building
      t.integer    :phone_num,     null: false
      t.timestamps
    end
  end
end
