class Product

  attr_reader :items

  PRODUCTS = [
    { coke: 1.00},
    { chips: 0.50},
    { camdy: 0.65}]

    def initialize
      @items = PRODUCTS
    end

end
