class CreatePhotoSets < ActiveRecord::Migration
  def change
    create_table :photo_sets do |t|
      t.references :created_by
      t.string :title
      t.text :description

      t.integer :position

      t.timestamps
    end
    add_index :photo_sets, :created_by_id
    add_index :photo_sets, :position
  end
end
