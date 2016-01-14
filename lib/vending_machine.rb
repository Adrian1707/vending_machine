class VendingMachine

  attr_reader :current_amount

  def initialize
    @current_amount = 0
  end

  def accept_coins(coin)
    @current_amount+=coin
  end

end
