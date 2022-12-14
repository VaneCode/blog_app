class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Assosiations
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  # Validations
  validates :name, presence: true
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal: 0

  # Methods
  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def admin?
    role == 'admin'
  end
end
