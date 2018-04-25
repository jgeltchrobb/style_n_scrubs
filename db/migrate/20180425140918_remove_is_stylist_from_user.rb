class RemoveIsStylistFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_stylist, :boolean
  end
end
