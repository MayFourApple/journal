class Task < ApplicationRecord
  belongs_to :category

  scope :today, -> { where(date: Date.today) }
end
