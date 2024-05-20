class Topic < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :title, :description, :target_meeting_date, presence: true

  after_create :add_initial_vote

  private

  def add_initial_vote
    votes.create(user: user)
  end
end
