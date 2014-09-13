class Post < ActiveRecord::Base
  acts_as_commentable

  extend FriendlyId
  friendly_id :title, use: [:finders, :slugged]

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true
end
