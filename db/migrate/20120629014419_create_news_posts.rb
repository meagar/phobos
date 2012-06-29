class CreateNewsPosts < ActiveRecord::Migration
  def change
    create_table :news_posts do |t|
      t.string :subject
      t.text :body
      t.references :created_by

      t.timestamps
    end
    add_index :news_posts, :created_by_id
  end
end
