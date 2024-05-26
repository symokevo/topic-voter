# app/models/blog_post.rb
class BlogPost < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :photo

  validates :title, :content, :category, presence: true

  # Define categories
  CATEGORIES = ["Event Announcement", "Product Release", "Service Release", "Conference Announcement", "Meetup"]
end
