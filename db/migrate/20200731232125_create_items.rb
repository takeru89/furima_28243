class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,            null: false, foreign_key: true
      t.string      :name,            null: false
      t.text        :introduction,    null: false
      t.integer     :category,        null: false
      t.integer     :condition,       null: false
      t.integer     :shipping_payer,  null: false
      t.integer     :shipping_from,   null: false
      t.integer     :shipping_date,   null: false
      t.integer     :price,           null: false
      t.timestamps
    end
  end
end
