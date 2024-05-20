class User < ApplicationRecord
  belongs_to :company, optional: true
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :full_name, :role, :email, presence: true
  validates :email, presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true, inclusion: { in: ['CTO', 'CEO', 'Team Lead', 'Member'] }
end
