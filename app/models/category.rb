class Category < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20 }
  validates :description, presence: true
  validates :description, length: { minimum: 10, maximum: 100 }

  has_many :tasks
end
