require 'date'

class Actor < ApplicationRecord
  has_one_attached :image

  has_many :casts

  has_many :movies, through: :casts

  validates :name, :gender, presence: true

  default_scope { order(created_at: :desc) }

  def age
    self.birthday ? ((Date.today - self.birthday) / 365).to_i : 0
  end
end
