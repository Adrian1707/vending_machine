require 'spec_helper'
require 'vending_machine'

describe 'VendingMachine' do
  subject(:vending_machine) { VendingMachine.new }
  let(:product) { double(:product)}

  before(:each) do
    allow(product).to receive(:items).and_return([
      { coke: 1.00},
      { chips: 0.50},
      { candy: 0.65}])
  end

  describe '#accept_coins' do

    it 'should accept coin and store the value of the coins' do
      vending_machine.accept_coins(2.00)
      expect(vending_machine.current_amount).to eq(2.00)
    end

    it 'should accept only valid coins and return invalid coin to customer' do
        expect{vending_machine.accept_coins(0.02)}.to raise_error "This is not a valid coin"
        expect(vending_machine.coin_return).to eq(0.02)
    end

    it 'should initialize with a set of valid coins' do
      expect(vending_machine.valid_coins).to eq([0.05, 0.10, 0.20, 0.50, 1.00, 2.00])
    end

  end

  describe '#select_product' do

    it 'should dispence the product if the correct amount is inserted' do
      vending_machine.add_items(product)
      vending_machine.accept_coins(1.00)
      vending_machine.accept_coins(0.50)
      vending_machine.select_product(:coke)
      vending_machine.select_product(:chips)
      expect(vending_machine.dispenced_products).to eq([:coke, :chips])
    end

    it 'should raise error if selected product is not in machine' do
      vending_machine.add_items(product)
      vending_machine.accept_coins(1.00)
      expect{vending_machine.select_product(:fanta)}.to raise_error "This product isn't in the machine"
    end

    it 'should raise error if the current amount is less then the value of the item selected' do
      vending_machine.add_items(product)
      vending_machine.accept_coins(0.20)
      expect{vending_machine.select_product(:coke)}.to raise_error "You need to add more money"
    end

    it 'should decrease the current amount when the user selects an item' do
      vending_machine.add_items(product)
      vending_machine.accept_coins(1.00)
      vending_machine.select_product(:candy)
      expect(vending_machine.current_amount).to eq(0.35)

    end
  end

  describe '#release_change' do

    it 'should release the left over money the customer has not spent' do
      vending_machine.add_items(product)
      vending_machine.accept_coins(1.00)
      vending_machine.select_product(:candy)
      vending_machine.release_change
      expect(vending_machine.current_amount).to eq(0)
      expect(vending_machine.coin_return).to eq(0.35)
    end

  end

end
