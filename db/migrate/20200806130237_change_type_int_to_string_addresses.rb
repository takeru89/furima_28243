class ChangeTypeIntToStringAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :phone_num, :string
  end
end
