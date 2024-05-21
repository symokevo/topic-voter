class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post

  validates :content, presence: true

  def metadata
    {
      user_name: user.full_name,
      company_name: user.company.name
    }
  end
end
