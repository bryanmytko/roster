class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :server
      t.boolean :active
      t.string :ranks
      t.integer :ilvl

      t.timestamps
    end
  end
end
