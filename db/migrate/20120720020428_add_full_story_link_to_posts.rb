class AddFullStoryLinkToPosts < ActiveRecord::Migration
  def change
    add_column :news_posts, :full_story_link, :string, :length => 1000
  end
end
