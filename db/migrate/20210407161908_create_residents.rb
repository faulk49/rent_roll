class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|

      t.timestamps
    end
  end
end
