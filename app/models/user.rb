class User < ApplicationRecord
  belongs_to :company, optional: true

  validates :full_name, :role, :email, presence: true
  validates :email, uniqueness: true
end
