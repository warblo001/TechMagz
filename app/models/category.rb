class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :priority, presence: true

  has_and_belongs_to_many :articles
end
