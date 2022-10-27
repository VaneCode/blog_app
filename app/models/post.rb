class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
