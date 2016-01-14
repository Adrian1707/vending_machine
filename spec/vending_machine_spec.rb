require 'spec_helper'
require 'vending_machine'

describe 'VendingMachine' do
  subject(:vending_machine) { VendingMachine.new }

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
