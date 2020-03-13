class Movie < ApplicationRecord
  has_many :casts

  has_many :actors, through: :casts

  has_many_attached :thumbnails

  validates :title, :description, :release_date, presence: true
end
