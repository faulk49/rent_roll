class RentRollReport

  attr_accessor :units, :date

  def initialize(date = Date.today)
    @date = date
    @units = Unit.includes(:residents).order(:unit_number)
  end

  def run
    units.each do |u|
      puts "Unit: #{u.unit_number}"
      puts "Floor plan: #{u.floor_plan}"
      if u.residents.none?
        puts "Vacant"
      else
        puts "Residents:"
        u.residents.each do |r|
          puts "#{r.name}"
          puts "Status: #{r.current_based_on_date(date: date)}"
          puts "Move in: #{r.move_in_date}"
          puts "Move out: #{r.move_out_date}"
        end
      end
      puts ""
    end
  end

  def key_stats(date = Date.today)
    vacant = Unit.vacant
    if vacant.any?
      puts "Vacant units:"
      vacant.each do |v|
        "Unit #{v.unit_number}"
      end
    else
      puts "No vacant units"
    end
  end
end
