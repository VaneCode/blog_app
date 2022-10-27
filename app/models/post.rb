class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  # Validations
  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal: 0

  # Methods
  after_create :update_user_posts_counter

  private

  def update_user_posts_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
