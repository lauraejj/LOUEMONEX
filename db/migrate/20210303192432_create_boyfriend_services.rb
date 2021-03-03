class CreateBoyfriendServices < ActiveRecord::Migration[6.0]
  def change
    create_table :boyfriend_services do |t|
      t.references :boyfriend, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
