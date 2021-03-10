class AddCoordinatesToBoyfriends < ActiveRecord::Migration[6.0]
  def change
    add_column :boyfriends, :latitude, :float
    add_column :boyfriends, :longitude, :float
  end
end
