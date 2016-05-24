class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
  validates :title, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end
