class Company < ApplicationRecord
  has_many :users
  before_create :generate_company_id

  validates :name, presence: true, uniqueness: true

  private
  def generate_company_id
    loop do
      self.company_id = "#{name[0].upcase}#{SecureRandom.alphanumeric(7).upcase}"
      break unles Company.exists?(company_id: company_id)
    end
  end
end
