class AddPermissionToSharedLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shared_lists, :permission, :integer
  end
end
