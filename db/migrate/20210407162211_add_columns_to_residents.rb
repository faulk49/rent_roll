class AddColumnsToResidents < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :name, :string
    add_column :residents, :status, :string
    add_column :residents, :move_in_date, :date
    add_column :residents, :move_out_date, :date
    add_reference :residents, :unit, foreign_key: true
  end
end
