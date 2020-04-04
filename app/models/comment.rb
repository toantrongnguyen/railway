class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :parent_comment, optional: true, class_name: :Comment
  has_many :replies, class_name: :Comment
end
