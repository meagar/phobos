class ArticleAttachment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :attachment, :name

  mount_uploader :attachment, ArticleAttachmentUploader

  validates :article, :presence => true
  validates :Attachment, :presence => true
end
