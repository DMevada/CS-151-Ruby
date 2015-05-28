require './Calendar'

class CalendarWork

  attr_accessor :days_of_events

  def initialize
    @days_of_events = {}
    @months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  end

  def show_start_menu
    puts
    puts "Welcome to the calendar system!"
    puts "---------------------------------"
    puts
    
    c = Calendar.new
    month = c.month_lookup_by_index(c.get_current_month.to_i)
    year = c.get_current_year

    c.print_calendar(month, year)
  end

end

cal = CalendarWork.new
puts cal.show_start_menu