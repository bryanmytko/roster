class AddThumbnailToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :thumbnail, :string
  end
end
