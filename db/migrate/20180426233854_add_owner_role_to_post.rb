class AddOwnerRoleToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :owner_role, :string
  end
end
