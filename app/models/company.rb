class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  before_create :generate_company_id

  private

  def generate_company_id
    self.company_id = "#{name[0].upcase}#{SecureRandom.alphanumeric(7).upcase}"
  end
end
