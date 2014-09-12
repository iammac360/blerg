class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserAvatarUploader

  def slug_candidates
    [
      :full_name,
      [:full_name, :id]
    ]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

   validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
   validates :password, format: { with: /(?=.*[A-Z])/, message: " must have one upper case" }, length: { minimum: 10 }
   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :slug, presence: true, uniqueness: true
end
