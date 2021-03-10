class AddPricesToBoyfriends < ActiveRecord::Migration[6.0]
  def change
    add_column :boyfriends, :price, :integer
  end
end
