class ForumPost < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User"
  belongs_to :forum, :touch => true
  belongs_to :parent, :class_name => "ForumPost", :touch => true
  has_many :replies, :class_name => "ForumPost"
end
