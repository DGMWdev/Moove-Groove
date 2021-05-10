class Activity < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :description, presence: true, length: {minimum: 10, maximum: 100}
  validates :name, presence: true
  validates :date, presence: true
  validates :duration, presence: true, unless: :repetitions
  validates :repetitions, presence: true, unless: :duration
  validates :distance, presence: true, unless: :repetitions
end