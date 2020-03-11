require 'date'

class Actor < ApplicationRecord
  validates :name, :gender, presence: true

  def age
    self.birthday ? ((Date.today - self.birthday) / 365).to_i : 0
  end
end