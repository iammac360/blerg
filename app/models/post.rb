class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true

end
