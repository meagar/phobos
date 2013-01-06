class RemoveColumnFromNewsPosts < ActiveRecord::Migration
  def up
    remove_column :news_posts, :front_page_column
  end

  def down
    add_column :news_posts, :front_page_column, :integer
  end
end
