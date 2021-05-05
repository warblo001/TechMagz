class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, too_short: 'name is too short' }

  has_many :authored_articles, class_name: 'Article', foreign_key: 'author_id'
  has_many :votes
  has_many :voted_articles, through: :votes, source: :article
end
