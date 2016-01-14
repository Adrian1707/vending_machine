class Product

  attr_reader :items

  PRODUCTS = [
    { item: :coke, price: 1.00},
    { item: :chips, price: 0.50},
    { item: :candy, price: 0.65}]

    def initialize
      @items = PRODUCTS
    end

end
