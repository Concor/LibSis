class AddAvatarToLibraries < ActiveRecord::Migration[5.1]
  def change
  	add_column :libraries, :avatar, :string
  end
end
