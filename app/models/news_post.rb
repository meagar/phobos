class NewsPost < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User"

  attr_accessible :subject, :body, :blurb, :blurb_subject, :front_page_column, :full_story_link

  validates :created_by, :presence => true
  validates :subject, :presence => true, :length => { :maximum => 255 }
  validates :body,    :length => { :maximum => 20000 }

  validates :blurb_subject, :length => { :maximum => 255 }
  validates :blurb, :length => { :maximum => 10000 }
  validates :front_page_column, :inclusion => [1, 2, 3], :allow_blank => true

  scope :front_page, where("front_page_column is not null").order(:front_page_column)

  after_save :must_only_have_one_post_per_column

  def url
    full_story_link.blank? ? self : full_story_link
  end

  protected

  def must_only_have_one_post_per_column
    NewsPost.
      where("front_page_column = ?", self.front_page_column).
      where("id != ?", self.id).
      update_all(:front_page_column => nil)
  end
end
