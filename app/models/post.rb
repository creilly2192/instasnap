class Post < ActiveRecord::Base
  acts_as_votable
  paginates_per 4
  scope :of_followed_users, -> (following_users) { where user_id: following_users }

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :image, presence: true
  validates :caption, length: { minimum: 3, maximum: 300 }

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
