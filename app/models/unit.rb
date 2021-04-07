class Unit < ApplicationRecord
  has_many :residents

  def self.vacant
    Unit.includes(:residents).where(residents: { id: nil })
  end
end
