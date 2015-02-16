require './BankComputer'
require './ATM'
require './Customer'
require './Bank'

class ATMSystem

  def show_start_menu
  	bank_computer_1 = BankComputer.new(1)
    bank_computer_2 = BankComputer.new(2)

  	atm1 = ATM.new(1000, 50, 300, 100, 1)
  	atm2 = ATM.new(1500, 100, 500, 250, 1)
    atm3 = ATM.new(2000, 200, 600, 300, 2)
    atm4 = ATM.new(2500, 100, 650, 400, 2)

  	bob = Customer.new("Bob", 123)
    bill = Customer.new("Bill", 456)
    jane = Customer.new("Jane", 789)
    sara = Customer.new("Sara", 100)

  	wells_fargo = Bank.new(1, bank_computer_1, atm1, atm2)
    citi_bank = Bank.new(2, bank_computer_2, atm3, atm4)

  	account = wells_fargo.create_account(1, bob, 500, 'savings')
  	bob_accounts = []
  	bob_accounts << account

    account2 = citi_bank.create_account(1, bill, 1000, 'checkings')
    bill_accounts = []
    bill_accounts << account2

    account3 = citi_bank.create_account(2, jane, 750, 'checkings')
    jane_acconuts = []
    jane_acconuts << account3

    account4 = citi_bank.create_account(2, sara, 250, 'checkings')
    sara_accounts = []
    sara_accounts << account4

  	customer_accounts = {account.card_number => bob_accounts, account2.card_number => bill_accounts}
    customer_accounts2 = {account3.card_number => jane_acconuts, account4.card_number => sara_accounts}

    bank_choice = 0

    while bank_choice != 5
      puts "Welcome to ATMSystem!"
      puts "-----------------------"
      puts "Choose ATM"

      puts "1) ATM 1"
      puts "2) ATM 2"
      puts "3) ATM 3"
      puts "4) ATM 4"
      puts "5) Exit"

      bank_choice = gets.chomp.to_i

      if bank_choice == 5
      	puts "Goodbye!"
      	return
      else
        if bank_choice == 1 || bank_choice == 2
          atm1.validate(1, customer_accounts) 
        end

        if bank_choice == 3 || bank_choice == 4
          atm2.validate(2, customer_accounts2)
        end
      end
    end   
  end
end

system = ATMSystem.new()
system.show_start_menu