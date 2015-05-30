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

    puts " #{month} #{year}"
    c.print_calendar(month, year)
    puts 
    puts 

    choice = 0

    while choice != 6 do
      puts "Choose an option"
      puts "------------------"

      puts "1) View by"
      puts "2) Create"
      puts "3) Go to"
      puts "4) Event list"
      puts "5) Delete"
      puts "6) Quit" 

      puts
      puts "Enter choice: "
      choice = gets.chomp.to_i

      if choice == 6
        break
        #check if there are any events, and if so,
        #save the events to an external file
      elsif choice == 1
        #show choose view
      elsif choice == 2
        puts 
        #show create view
      elsif choice == 3
        puts
        #show go to
      elsif choice == 4
        puts
        #Show events
      elsif choice == 5
        puts
        #Show delete event
      else
        puts "Please select a choice from the menu"
        puts
      end
    end
  end
end

cal = CalendarWork.new
puts cal.show_start_menu