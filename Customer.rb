class Customer

  attr_accessor :name, :pass, :accounts, :cash_card

  def initialize(name, pass)
    @name = name
    @pass = pass
  end
end