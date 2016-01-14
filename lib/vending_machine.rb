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
    return_coin_if_invalid(coin)
    raise "This is not a valid coin" if coin_invalid?(coin)
    increase_current_amount(coin)
  end

  def select_product(item)
    raise_errors(item)
    @dispenced_products << item
    decrease_current_amount(item)
  end

  def release_change
    @coin_return = @current_amount
    @current_amount = 0
  end

  private

  def coin_invalid?(coin)
    @valid_coins.include?(coin) ? false : true
  end

  def return_coin_if_invalid(coin)
    if coin_invalid?(coin)
      @coin_return = coin
    end
  end

  def increase_current_amount(coin)
    @current_amount+=coin
  end

  def decrease_current_amount(item)
    @current_amount-=price_of_item(item)
  end

  def raise_errors(item)
    raise "This product isn't in the machine" if product_in_machine?(item) == false
    raise "You need to add more money" if @current_amount < price_of_item(item)
  end

  def price_of_item(item)
    @products.items.each do |x|
      x.each do |key,value|
        if key == item
          return value
        end
      end
    end
  end

  def product_in_machine?(item)
    products.items.map{|x| x.keys}.flatten.include?(item)
  end

end
