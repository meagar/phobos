class AddSubTitleToPhotoSets < ActiveRecord::Migration
  def change
    add_column :photo_sets, :sub_title, :string
  end
end
