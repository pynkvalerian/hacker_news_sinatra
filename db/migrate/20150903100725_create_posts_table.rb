class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
