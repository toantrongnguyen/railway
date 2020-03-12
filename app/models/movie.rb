class Movie < ApplicationRecord
  has_many :casts

  has_many :actors, through: :casts

  validates :title, :description, :release_date, presence: true
end
