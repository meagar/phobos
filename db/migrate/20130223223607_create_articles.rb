class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :format
      t.references :author
      t.integer :position
      t.timestamp :publish_on

      t.timestamps
    end
    add_index :articles, :author_id
  end
end
