class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.references :created_by
      t.references :thread
      t.references :parent
      t.string :created_by
      t.string :topic
      t.string :body

      t.timestamps
    end
    add_index :forum_posts, :thread_id
    add_index :forum_posts, :parent_id
    add_index :forum_posts, :created_by_id
  end
end
