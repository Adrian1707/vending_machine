require 'spec_helper'
require 'vending_machine'
require 'product'

describe 'VendingMachine' do
  subject(:vending_machine) { VendingMachine.new }

  describe '#accept_coins' do

    it 'should accept coin and store the value of the coins' do
      vending_machine.accept_coins(2.00)
      expect(vending_machine.current_amount).to eq(2.00)
    end

    it 'should accept only valid coins worth more than 10p and return coin to customer' do
        expect{vending_machine.accept_coins(0.02)}.to raise_error "This is not a valid coin"
        expect(vending_machine.coin_return).to eq(0.02)
    end

    it 'should initialize with a set of valid coins' do
      expect(vending_machine.valid_coins).to eq([0.05, 0.10, 0.20, 0.50, 1.00, 2.00])
    end

  end

  describe '#select_product' do

    it 'should dispence the product if the correct amount is inserted' do
      vending_machine.add_items(Product.new)
      vending_machine.accept_coins(1.00)
      vending_machine.select_product(:coke)
      vending_machine.select_product(:chips)
      expect(vending_machine.dispenced_products).to eq([:coke, :chips])
    end

    it 'should raise error if selected product is not in machine' do
      vending_machine.add_items(Product.new)
      vending_machine.accept_coins(1.00)
      expect{vending_machine.select_product(:fanta)}.to raise_error "This product isn't in the machine"
    end

  end

end
