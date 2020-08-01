class ChangeColumnToItem < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :category, :category_id
    rename_column :items, :condition, :condition_id
    rename_column :items, :shipping_payer, :shipping_payer_id
    rename_column :items, :shipping_from, :prefecture_id
    rename_column :items, :shipping_date, :shipping_within_id
  end
end
