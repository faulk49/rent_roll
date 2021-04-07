class AddColumnsToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :unit_number, :integer
    add_column :units, :floor_plan, :string
  end
end
