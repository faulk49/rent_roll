class Resident < ApplicationRecord
  belongs_to :unit
  validates :name, presence: true

  def current_based_on_date(date:)
    if move_in_date
      if (move_in_date <= date) && (move_out_date.blank? || move_out_date > date)
        'current'
      elsif move_in_date > date
        'future'
      end
    end
  end
end
