class BlogPost < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :content, presence: true

  def metadata
    {
      creator_name: user.full_name,
      creator_role: user.role,
      company_name: user.company.name
    }
  end
end
