require 'csv'

namespace :reports do
  desc 'Generate report on residents'
    task populate_resident_data: :environment do
      csv_text = File.read(Rails.root.join("lib","assets", "units-and-residents.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        unit = Unit.find_or_initialize_by(unit_number: row['unit'])
        unit.floor_plan = row['floor_plan']
        unit.save

        resident = Resident.find_or_initialize_by(name: row['resident'])
        resident.unit = unit
        resident.move_in_date = row['move_in']
        resident.move_out_date = row['move_out']
        resident.save
      end
      puts "There are #{Unit.count} units and #{Resident.count} residents"
  end
end
