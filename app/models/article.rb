class Article < ActiveRecord::Base
  FORMATS = %w(HTML Markdown)

  belongs_to :author, :class_name => "User"
  has_many :attachments, :class_name => "ArticleAttachment"

  attr_accessible :body, :format, :title, :publish_on

  validates :title,  :presence => true, :length => { :maximum => 255 }
  validates :author, :presence => true
  validates :format, :presence => true, :inclusion => { :in => FORMATS }
  validates :publish_on, :presence => true
end
