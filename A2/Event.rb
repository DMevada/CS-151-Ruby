class Event

  attr_accessor :title, :date, :start_time, :end_time, :day_of_month, :month, :year

  def initialize
    @months = {1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec"}
  end

  def to_s
    "#{@months[month]} #{day_of_month}, #{start_time} - #{end_time} #{title}"
  end  
end