class AddEditPhoneTypeToSubscribers < ActiveRecord::Migration[5.1]
  def change
  	change_column :subscribers, :phone, :BIGINT
  end
end
