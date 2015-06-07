require './Calendar'

class CalendarWork

  attr_accessor :days_of_events

  def initialize
    @days_of_events = {}
    @months = {1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec"}
  end

  def show_start_menu
    puts
    puts "Welcome to the calendar system!"
    puts "---------------------------------"
    puts
    
    c = Calendar.new
    month = c.get_current_month
    year = c.get_current_year

    puts " #{month}, #{year}"
    puts
    c.print_calendar(month, year)
    puts 
    puts 

    choice = ""

    while choice.downcase != "q" do
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
      puts

      if choice.downcase == "q"
        break
        #check if there are any events, and if so,
        #save the events to an external file
      elsif choice.downcase == "v"
        show_view_choose_by_view(c)        
        puts
      elsif choice.downcase == "c"
        puts 
        #show create view
      elsif choice.downcase == "g" 
        puts
        #show go to
      elsif choice.downcase == "e"
        puts
        #Show events
      elsif choice.downcase == "d"
        puts
        #Show delete event
      else
        puts "Please select a choice from the menu"
        puts
      end
    end
  end

  def show_view_choose_by_view(calendar)
    puts "Choose an option"
    puts "1) Day view [D]"
    puts "2) Month view [M]"
  
    choice = gets.chomp

    if choice.downcase == 'm'
      puts
      show_view_by_month(calendar)
    elsif choice.downcase == 'd'  
      #show view by day
    else
      puts
      puts "Invalid option, try again"
      puts      
    end
    
    puts "#{calendar.month}, #{calendar.year}"
    calendar.day = 1  
    calendar.print_calendar(calendar.month, calendar.year)
    puts
  end

  def show_view_by_month(calendar)
    choice = ""
    calendar.day = 1
    puts "#{calendar.month} #{calendar.year}"
    puts
    calendar.print_calendar(calendar.month, calendar.year)
    puts
    puts

    while choice.downcase != 'm' do
      puts "Choose an option"
      puts "------------------"
      puts "1) Previous month [P]"
      puts "2) Next month [N]"
      puts "3) Main menu [M]"

      choice = gets.chomp
      puts

      if choice.downcase == 'm'
        puts "#{calendar.month} #{calendar.year}"
        puts
        calendar.print_calendar(calendar.month, calendar.year)
        puts

        return

      elsif choice.downcase == 'p'
        index = calendar.month_lookup_by_name(calendar.month)

        if index == 1
          index = 12
          calendar.year = calendar.year - 1
          calendar.month = "Dec"
          calendar.day = 1

          puts "#{calendar.month} #{calendar.year}"
          puts
          calendar.print_calendar("Dec", calendar.year)
          puts
        else  
          index -= 1
          calendar.month = calendar.month_lookup_by_index(index)
          calendar.day = 1

          puts "#{calendar.month} #{calendar.year}"
          puts
          calendar.print_calendar(calendar.month, calendar.year)
          puts
          puts
        end

      elsif choice.downcase == 'n'
        puts
        index = calendar.month_lookup_by_name(calendar.month)
        if index == 12
          index = 1
          calendar.year = calendar.year + 1
          calendar.month = "Jan"
          calendar.day = 1

          puts "#{calendar.month} #{calendar.year}"
          puts
          calendar.print_calendar("Jan", calendar.year)
          puts
        else  
          index += 1
          calendar.month = calendar.month_lookup_by_index(index)
          calendar.day = 1
          puts "#{calendar.month} #{calendar.year}"

          puts
          calendar.print_calendar(calendar.month, calendar.year)
          puts
          puts
        end
      else  
        puts "Invalid option, select an option from the menu"    
        puts  
      end
    end
  end
end

cal = CalendarWork.new
puts cal.show_start_menu