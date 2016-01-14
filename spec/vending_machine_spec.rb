require 'spec_helper'
require 'vending_machine'

describe 'VendingMachine' do
  subject(:vending_machine) { VendingMachine.new }
  it 'should accept coin and store the value of the coins' do
    vending_machine.accept_coins(2.00)
    expect(vending_machine.current_amount).to eq(2.00)
  end
end
