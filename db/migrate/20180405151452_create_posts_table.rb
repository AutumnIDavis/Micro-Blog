class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
      create_table :posts do |t|
          t.string :title, :limit => 50
          t.text :content, :limit => 150
          t.integer :user_id

      end
  end
end
