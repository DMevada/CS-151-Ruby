require './CashCard'
require './Account'

class Bank
  
  attr_accessor :bank_id, :bank_computer, :atm1, :atm2	

  def initialize(bank_id, bank_computer, atm1, atm2)
  	@bank_id = bank_id
  	@bank_computer = bank_computer
  	@atm1 = atm1
  	@atm2 = atm2
  end
  
  def create_account(bank_id, customer, balance, account_type)
    bank_computer = BankComputer.new(bank_id)
    card_number = bank_computer.create_card_number
    expiration_date = bank_computer.create_expiration_date
    name = 	customer.name
    pin = customer.pass

    card = CashCard.new(bank_id, card_number, expiration_date)
    account = Account.new(balance, card_number, pin, account_type, name, expiration_date, bank_id)
    account
  end
end