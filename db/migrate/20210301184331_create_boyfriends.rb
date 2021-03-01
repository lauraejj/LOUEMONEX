class CreateBoyfriends < ActiveRecord::Migration[6.0]
  def change
    create_table :boyfriends do |t|
      t.string :name
      t.integer :age
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.string :ville

      t.timestamps
    end
  end
end
