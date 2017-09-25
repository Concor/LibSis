class AddAvatarMnameToWorkers < ActiveRecord::Migration[5.1]
  def change
  	add_column :workers, :avatar, :string
  	add_column :workers, :mname, :string
  end
end
