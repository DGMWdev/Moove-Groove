class Activity < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :description, presence: true, length: {minimum: 10, maximum: 100}
  # validates :date, presence: true
  # validates :duration, presence: true, unless: :repetitions
  # validates :repetitions, presence: true, unless: :duration
end