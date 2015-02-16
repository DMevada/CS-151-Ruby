class Account

  attr_accessor :balance, :card_number, :password, :account_type, :customer_name, :expiration_date, :bank_id

  def initialize(balance, card_number, password, account_type, customer_name, expiration_date, bank_id)
  	@balance = balance
  	@card_number = card_number
  	@password = password
  	@account_type = account_type
  	@customer_name = customer_name
  	@expiration_date = expiration_date
  	@bank_id = bank_id
  end
end