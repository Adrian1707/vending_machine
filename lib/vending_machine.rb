class VendingMachine

  attr_reader :current_amount, :coin_return, :valid_coins, :dispenced_products, :products

  def initialize
    @current_amount = 0
    @coin_return = 0
    @valid_coins = [0.05, 0.10, 0.20, 0.50, 1.00, 2.00]
    @dispenced_products = []
  end

  def add_items(products)
    @products = products
  end

  def accept_coins(coin)
    if coin_invalid?(coin)
      @coin_return = coin
    end
    raise "This is not a valid coin" if coin_invalid?(coin)
    @current_amount+=coin
  end

  def select_product(item)
    raise "This product isn't in the machine" if product_in_machine?(item) == false
    @dispenced_products << item
  end

  private

  def coin_invalid?(coin)
    @valid_coins.include?(coin) ? false : true
  end

  def product_in_machine?(item)
    products.items.map{|x| x[:item]}.include?(item)
  end

end
