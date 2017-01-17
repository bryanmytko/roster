class ChangeServerToRealm < ActiveRecord::Migration[5.0]
  def change
    rename_column :members, :server, :realm
    rename_column :members, :ilvl, :ilvl_equipped
    add_column :members, :ilvl_display, :integer
  end
end
