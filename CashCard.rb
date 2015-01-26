class CashCard

  attr_accessor :bank_id, :card_number, :expiration_date

  def initialize(bank_id, card_number, expiration_date)
  	@bank_id = bank_id
  	@card_number = card_number
  	@expiration_date = expiration_date
  end
end