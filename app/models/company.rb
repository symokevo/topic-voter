class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  before_validation :generate_company_code, on: :create # Generate company_id before validation

  def generate_company_code
    self.company_code = "#{name[0].upcase}#{SecureRandom.alphanumeric(7).upcase}" if name.present? && new_record?
  end
end
