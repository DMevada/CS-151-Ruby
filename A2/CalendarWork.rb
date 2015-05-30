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

    choice = ""

    while choice.casecmp("Q") == -1 do
      puts "Choose an option"
      puts "------------------"

      puts "1) View by [V]"
      puts "2) Create [C]"
      puts "3) Go to [G]"
      puts "4) Event list [E]"
      puts "5) Delete [D]"
      puts "6) Quit [Q]" 

      puts
      puts "Enter choice: "
      choice = gets.chomp

      if choice.casecmp("Q") == 0
        break
        #check if there are any events, and if so,
        #save the events to an external file
      elsif choice.casecmp("V") == 0
        puts 
        #show choose view
      elsif choice.casecmp("C") == 0
        puts 
        #show create view
      elsif choice.casecmp("G") == 0
        puts
        #show go to
      elsif choice.casecmp("E") == 0
        puts
        #Show events
      elsif choice.casecmp("D") == 0
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