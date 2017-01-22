class AddArmoryToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :armory_link, :string
  end
end
