class User < ApplicationRecord
  belongs_to :company, optional: true
  has_secure_password
  has_many :topics, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :blog_posts, dependent: :destroy

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :full_name, :role, :email, presence: true
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: ['CTO', 'CEO', 'Team Lead', 'Member', 'Company Head'] }
end
