class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  # Validations
  validates :title, presence: true, length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal: 0

  # Methods
  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
