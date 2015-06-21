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
      puts
      show_view_by_day(calendar)
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

        # Jan, previous month is Dec
        if index == 1
          index = 12
          calendar.year = calendar.year - 1
          calendar.month = "Dec"
          calendar.day = 1

          puts "#{calendar.month} #{calendar.year}"
          puts
          calendar.print_calendar("Dec", calendar.year)
          puts

        # Not Jan  
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

        # Dec, next month is Jan
        if index == 12
          index = 1
          calendar.year = calendar.year + 1
          calendar.month = "Jan"
          calendar.day = 1

          puts "#{calendar.month} #{calendar.year}"
          puts
          calendar.print_calendar("Jan", calendar.year)
          puts

        # Not Dec
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

  def show_view_by_day(calendar)
    choice = ""
    puts "#{calendar.print_calendar_day(calendar.today, calendar.month, calendar.year)}"
    puts

    calendar.day = calendar.today
    calendar.month = calendar.get_current_month
    calendar.year = calendar.get_current_year

    while choice.downcase != 'm'
      puts "Choose an option"
      puts "------------------"
      puts "1) Previous day [P]"
      puts "2) Next day [N]"
      puts "3) Main menu [M]"

      choice = gets.chomp   

      if choice.downcase == 'm'
        return

      elsif choice.downcase == 'p'
        # puts "#{calendar.print_calendar_day(calendar.day, calendar.month, calendar.year)}"
        puts
        index = calendar.month_lookup_by_name(calendar.month)

        # Jan 1st
        if index == 1 && calendar.day == 1
          index = 12
          calendar.year = calendar.year - 1
          calendar.month = "Dec"

          last_day =  calendar.calculate_days_month(calendar.month, calendar.year)
          calendar.day =  last_day
          calendar.print_calendar_day(last_day, calendar.month, calendar.year)

       # Not Jan 1st  
        else  

          # first day of month
          if calendar.day == 1
            index -=1
            calendar.month = calendar.month_lookup_by_index(index)
            last_day =  calendar.calculate_days_month(calendar.month, calendar.year)

            calendar.day = last_day
            calendar.print_calendar_day(last_day, calendar.month, calendar.year)
            puts

          # not the first day of the month  
          else  
            previous_day =  calendar.day - 1
            calendar.day = previous_day
            calendar.print_calendar_day(previous_day, calendar.month, calendar.year)
            puts
          end
        end
            
      elsif choice.downcase == 'n'      
        index = calendar.month_lookup_by_name(calendar.month)
        puts

        # Dec 31st
        if index == 12 && calendar.day == 31
          index = 0
          calendar.year = calendar.year + 1
          calendar.month = "Jan"

          calendar.day = 1
          first_day = calendar.day
          calendar.print_calendar_day(first_day, calendar.month, calendar.year)
        
        # Not Dec 31st  
        else
          
          # End of month
          if calendar.day == calendar.calculate_days_month(calendar.month, calendar.year)
            index += 1
            calendar.month = calendar.month_lookup_by_index(index)

            calendar.day = 1
            calendar.print_calendar_day(calendar.day, calendar.month, calendar.year)
            puts

          # Not end of month  
          else  
            calendar.day = calendar.day + 1
            calendar.print_calendar_day(calendar.day, calendar.month, calendar.year)
            puts
          end
        end

      else  
        puts "Invalid option, select an option from the menu"    
        puts      
      end
    end
  end

  def show_create_event(calendar)
    choice = ""

    title = ""
    date = ""
    start = ""
    stop = ""
    event = Event.new

    while choice.downcase != 'm'
      puts "1) Create Event [C]"
      puts "2) Main Menu [M]"

      choice = gets.chomp

      if choice.downcase == 'c'
        puts "Enter title: "
        title = gets.chomp

        puts "Enter date as MM/DD/YYYY: "
        date = gets.chomp

        puts "Enter start time as 00:00 format"
        start = gets.chomp

        puts "Enter stop time as 00:00 or n to skip"
        stop = gets.chomp
        
        day_of_month = date[3..4]
        month = date[0..1]
        year = date[6..date.length]

        event.title = title
        event.date = date
        event.start_time = start
        event.end_time = stop
        event.day_of_month = day_of_month
        event.month = month_lookup_by_index
        event.year = year

        if days_of_events.has_key?(date)
          days_of_events[:date] << event 
        else
          days_of_events[:date] = []
          days_of_events[:date] << event  
        end  

      end  

    end

  end

end

cal = CalendarWork.new
puts cal.show_start_menu