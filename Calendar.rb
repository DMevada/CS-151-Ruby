require 'date'

class Calendar

  attr_accessor :day, :col, :today, :month, :months, :year
  attr_reader :rows, :columns

  def initialize
    @months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @rows = 6
    @columns = 7
    @col, @today = 0
    @day = 1
    @month = ""
    @year = 0
  end 

  def calculate_days_month(month, year)

    return 30 if month.downcase == "apr" || month.downcase == "jun" || month.downcase == "sep" || month.downcase == "nov"

    if month.downcase == "feb"
      return 29 if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
      return 28
    else
      return 31
    end
  end

  def month_lookup_by_index(index)
    @months[index]
  end

  def month_lookup_by_name(name)
    @months.index(name)
  end

  def get_first_day_of_month(month, year)
    @month = month
    date = Date.new(year, month_lookup_by_name(month) + 1, 1)
    return date.strftime('%a')[0...2]
  end

  def get_last_day_of_month(month, year)
    last_day_of_month = calculate_days_month(month, year)
    @month = month
    @day = last_day_of_month

    return Time.new(year, month_lookup_by_name(month) + 1, last_day_of_month).strftime('%a')[0...2]
  end

  def get_current_day_of_week()
    Time.new.strftime('%a')[0...2]
  end

  def get_current_day_of_month()
    current_day_of_month = Time.new.strftime('%d')
    @today = current_day_of_month
    current_day_of_month
  end

  def get_current_month
    Time.new.strftime('%m')
  end

  def get_current_year
    Time.new.strftime('%Y')
  end

  def initialize_month(month, year)
    first_day_of_month = get_first_day_of_month(month, year)
    @today =  get_current_day_of_month
    
    if first_day_of_month == "Su"
      @col = 0
    elsif first_day_of_month == "Mo"
      @col = 1
      print "   "
    elsif first_day_of_month == "Tu"
      @col = 2
      print "      "
    elsif first_day_of_month == "We"
      @col = 3
      print "         "
    elsif first_day_of_month == "Th"
      @col = 4
      print "            "
    elsif first_day_of_month == "Fr"
      @col = 5
      print "               "  
    elsif first_day_of_month ==  "Sa"
      @col = 6
      print "                  "
    end 
    @col
  end

  def print_calendar(month, year)
    puts " Su Mo Tu We Th Fr Sa"
    num_of_days = calculate_days_month(month, year)
    @month = month
    @year = year

    i = @day

    while i <= num_of_days do 
      if i < 10
        if @col == 6
          print "  #{i}"
          puts
          @col = 0
        else
         print "  #{i}"
         @col += 1
        end
      else
        if @col == 6
          print " #{i}"
          puts
          @col = 0
        else  
          print " #{i}"
          @col += 1
        end
      end
      i+=1  
    end
  end
end

cal = Calendar.new
#puts cal.months[2]
#puts cal.month_lookup_by_name("Sep")
#puts cal.day = 1
#puts cal.get_first_day_of_month("Feb", 2015)
#puts cal.get_last_day_of_month("Feb", 2014)
#puts cal.month
#puts cal.get_current_day_of_week
puts cal.get_current_day_of_month
#puts cal.get_current_month
#puts cal.get_current_year
#puts cal.print_calendar("Aug", 2015)