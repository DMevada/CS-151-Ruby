class BankComputer

  attr_accessor :bank_id, :customer_accounts 

  @@card_number = 1000

  def initialize(bank_id)
  	@bank_id = bank_id
  end
  
  def self.card_number 
  	@@card_number
  end

  def create_card_number
  	card_number_for_account = @@card_number + 1
    @@card_number += 1
    card_number_for_account
  end

  def authorize(card_number, customer_accounts)
    attempts = 0
    current_date = "#{Time.now.year}/#{Time.now.month}/#{Time.now.day}"
    @customer_accounts = customer_accounts

    begin
      if(!customer_accounts.has_key?(card_number))
      end
    rescue Exception => e
       puts "This card doesn't exist in the system"
       return       
    end
    
    if current_date == customer_accounts[card_number][0].expiration_date
      puts "Sorry, card has expired, here's your card." 
    else
      logged_in = false

      while(logged_in == false && attempts < 3)
        puts "Enter pin number: "
        pin = gets.chomp.to_i

        if(check_pin(pin, card_number))
          return true   
        else
          if attempts == 2
            puts "Too many attempts, keeping card, please call bank"
            return false            
          end
          attempts += 1
        end  
      end
    end
  end

  def check_pin(pin, card_number)
    if pin == @customer_accounts[card_number][0].password
      puts "Access granted! \n"
       return true
    else 
      puts "Incorrect password" 
    end
    false
  end

  def create_expiration_date
    date = Time.now
    year = date.year+3
    month = date.month
    day = date.day
    
    return "#{year}/#{month}/#{day}"
  end
end	