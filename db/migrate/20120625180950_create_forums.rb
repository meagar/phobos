class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.references :created_by
      t.string :name
      t.string :description
      t.integer :position

      t.timestamps
    end
    add_index :forums, :created_by_id
  end
end
