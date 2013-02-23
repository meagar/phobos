class CreateArticleAttachments < ActiveRecord::Migration
  def change
    create_table :article_attachments do |t|
      t.references :article
      t.string :name
      t.text :attachment

      t.timestamps
    end
    add_index :article_attachments, :article_id
  end
end
