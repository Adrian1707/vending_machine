class VendingMachine

  attr_reader :current_amount, :coin_return, :valid_coins

  def initialize
    @current_amount = 0
    @coin_return = 0
    @valid_coins = [0.05, 0.10, 0.20, 0.50, 1.00, 2.00]
  end

  def accept_coins(coin)
    if coin_invalid?(coin)
      @coin_return = coin
    end
    raise "This is not a valid coin" if coin_invalid?(coin)
    @current_amount+=coin
  end

  private

  def coin_invalid?(coin)
    @valid_coins.include?(coin) ? false : true
  end

end
