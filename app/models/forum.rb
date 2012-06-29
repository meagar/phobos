class Forum < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User"

  has_many :posts, :class_name => "ForumPost"
end
