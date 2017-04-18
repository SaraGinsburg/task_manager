class CreateSharedLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_lists do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
