require './BankComputer'

class ATM
  attr_accessor :current_withdrawed_in_day, :available_cash, :bank_id
  attr_reader :MAX_WITHDRAW_PER_TRANSACTION, :MAX_WITHDRAW_PER_DAY, :MIN_AMOUNT

  @@starting_cash = 0
  @customer_accounts = {}
  
  def initialize(starting_cash, min_amount, max_withdraw_per_day, max_withdraw_per_transaction, bank_id)
  	@@starting_cash = starting_cash

  	@MIN_AMOUNT = min_amount
  	@MAX_WITHDRAW_PER_DAY = max_withdraw_per_day
  	@MAX_WITHDRAW_PER_TRANSACTION = max_withdraw_per_transaction
  	
  	@available_cash = starting_cash
  	@bank_id = bank_id
  	@attempts = 0
    @current_withdrawed_in_day = 0
  end

  def self.starting_cash
  	@@starting_cash
  end

  def validate(bank_id, customer_accounts)
  	if @@starting_cash <= @MIN_AMOUNT
  	  puts "Not enough cash in the ATM"
  	  return 
  	end

    puts 'Enter card number: '
    card_number = gets.chomp.to_i
    @customer_accounts = customer_accounts

    begin
      if(bank_id != customer_accounts[card_number][0].bank_id)
      end
    rescue Exception => e
      puts 'Sorry, wrong bank id'
      return 
    end

    bank_computer = BankComputer.new(bank_id)
    start_transaction_dialog(card_number) if bank_computer.authorize(card_number, customer_accounts)
  end

  def start_transaction_dialog(card_number)
    puts ""

    puts "Enter withdrawal amount: "
    amount = gets.chomp.to_i

    if amount > @MAX_WITHDRAW_PER_TRANSACTION
      puts "Sorry, you are attempting to withdraw more than the transcation limit"
      return
    end

    if @current_withdrawed_in_day == @MAX_WITHDRAW_PER_DAY
      puts "Sorry, cannot withdraw more than maximum amount per day"
      return 
    end

    if amount > @available_cash
      puts "Sorry cannot withdraw more than current ATM balance"
      return 
    end

    if amount > @customer_accounts[card_number][0].balance
      puts "Sorry, you don't have enough in your account to permit this transaction"
      return 
    end

    withdraw(amount, card_number)
  end

  def withdraw(amount, card_number)
    @customer_accounts[card_number][0].balance = @customer_accounts[card_number][0].balance - amount
    @available_cash -= amount
    @current_withdrawed_in_day += amount

    puts "Account balance: #{@customer_accounts[card_number][0].balance}"
    puts "ATM balance: #{available_cash}"
    puts "You have withdrawed: #{amount}"
  end
end