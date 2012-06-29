class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :photo_set
      t.references :created_by
      t.string :image, :null => false
      t.string :title
      t.boolean :is_thumbnail, :null => false
      t.text :description
      t.integer :position

      t.timestamps
    end
    add_index :photos, :photo_set_id
    add_index :photos, :created_by_id
    add_index :photos, :position
  end
end
