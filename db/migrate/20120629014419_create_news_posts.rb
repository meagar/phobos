class CreateNewsPosts < ActiveRecord::Migration
  def change
    create_table :news_posts do |t|
      t.string :subject
      t.text :body
      t.integer :front_page_column
      t.references :created_by

      t.string :blurb_subject
      t.text :blurb

      t.timestamps
    end
    add_index :news_posts, :created_by_id
  end
end
