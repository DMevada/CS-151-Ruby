#old way of printing calendar, too complex and unnecessary

cal_array = [[]]

  for i in 0...@rows

      #if it's the first row, start with the column that is set in the case statement
      if i == 0
      	
      	for j in @col...@columns

      	  #if the day is less than the total number of fays for this month
          if @day < num_of_days

            #if the day and month is today, then add brackets
           	if @day == @today && @month == get_current_month
           	  cal_array[i][j] == @day
              @day += 1
              puts "[#{cal_array[i][j]}]"

            #otherwise display normally
            else 
              cal_array[i][j] = @day
              @day += 1
              puts "  #{cal_array[i][j]}"   
           	end
          end 
        end

      #otherwise, start from column 0
      else
        for j in 0...@columns 

          #if the day is less than the total number of days for this month
          if @day < num_of_days

          	#if day is less than 10, leave 2 spaces
            if @day < 10

              #if day and month is today, add brackets 	
              if @day == @today && @month == get_current_month
                cal_array[i][j] = @day
                @day += 1 
                puts "[#{cal_array[i][j]}]"	

              #otherwise, display normally  
              else
                cal_array[i][j] = @day
                @day += 1
                puts "  #{cal_array[i][j]}"  	
              end

            else

              #if day and month is today, add brackets
              if @day == @today && @month == get_current_month
                cal_array[i][j] = @day
                @day += 1
                puts "[#{cal_array[i][j]}]" 
              
              #otherwise, display normally
              else
                cal_array[i][j] = @day
                @day += 1
                puts " #{cal_array[i][j]}"  	
              end  
            end
          end
        end
      end
      puts 
    end