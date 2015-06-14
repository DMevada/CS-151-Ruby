require 'date'

class Calendar

  attr_accessor :day, :col, :today, :month, :months, :year, :current_month, :current_year
  attr_reader :rows, :columns

  def initialize
    @months = {1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec"}
    @rows = 6
    @columns = 7
    @col = 0
    @today = get_current_day_of_month
    @day = 1
    @month = get_current_month
    @year = get_current_year
    @current_month = get_current_month
    @current_year = get_current_year
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
    @months.key(name)
  end

  def get_first_day_of_month(month, year)
    date = Date.new(year.to_i, month_lookup_by_name(month), 1)
    return date.strftime('%a')[0...2]
  end

  def get_last_day_of_month(month, year)
    last_day_of_month = calculate_days_month(month, year)
    @day = last_day_of_month
    return Time.new(year, month_lookup_by_name(month), last_day_of_month).strftime('%a')[0...2]
  end

  def get_current_day_of_week
    Time.new.strftime('%a')[0...2]
  end

  def get_current_day_of_month
    current_day_of_month = Time.new.strftime('%d')
    @today = current_day_of_month.to_i
  end

  def get_current_month
    @month = month_lookup_by_index(Time.new.strftime('%m').to_i)
  end

  def get_current_year
    Time.new.strftime('%Y').to_i
  end

  def initialize_month(month, year)
    first_day_of_month = get_first_day_of_month(month, year)

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
    if !@months.values.include?(month)
      return "Invalid month, enter a 3 letter abbreviation of a month"

    else
      puts " Su Mo Tu We Th Fr Sa"
      num_of_days = calculate_days_month(month = month.capitalize, year)
      @col = initialize_month(month = month.capitalize, year)

      while @day <= num_of_days do 

        #day is less than 10, print 2 spaces
        if @day < 10

          #if the day is today, add brackets, and print only 1 space
          if @day == @today && @month == @current_month && @year == @current_year 
            if @col == 6
              print " [#{@day}]"
              puts
              @col = 0
            else
              print " [#{@day}]"
              @col += 1
            end

          #otherwise, do not add brackets
          else
            if @col == 6
              print "  #{@day}"
              puts
              @col = 0
            else
              print "  #{@day}"
              @col += 1
            end
          end
  
        #day is greater than 10
        else  

          #if the day is today, add brackets, and print only 1 space
          if @day == @today && @month == @current_month && @year == @current_year
            if @col == 6
              print " [#{@day}]"
              puts
              @col = 0
            else
              print " [#{@day}]"   
              @col += 1         
            end
  
          #otherwise, do not add brackets
          else
            if @col == 6
              print " #{@day}"
              puts
              @col = 0
            else  
              print " #{@day}"
              @col += 1
            end
          end
        end

        @day += 1 
      end
    end
    @day -= 1
  end 

  def print_calendar_day(day_of_month, month, year)
    month = @months.key(month)

    if day_of_month > 31 || month >  12 || month < 1 || year.to_s.length < 4
      return "enter a valid date"  
    elsif month < 10
      month = "0#{month.to_s}"
    elsif day_of_month < 10
      day_of_month = "0#{day_of_month.to_s}"
    end

    date_to_parse = "#{year.to_s}-#{month.to_s}-#{day_of_month}.to_s"
    date = DateTime.parse("#{date_to_parse}")
    formatted_date = date.strftime('%a, %b %d')

    puts "#{formatted_date}"
  end 
end