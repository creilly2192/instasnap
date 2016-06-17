class Post < ActiveRecord::Base
  validates :image, attachment_presence: true
  validates :user_id, presence: true
  validates :caption, length: { maximum: 300 }

  has_attached_file :image, styles: { :medium => "640px" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, dependent: :destroy
end
