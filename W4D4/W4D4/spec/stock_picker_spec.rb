require 'rspec'
require 'stock_picker'


describe 'stock_picker' do

    let(:arr) { [1,3,7,5] }

    it "accept an array" do
        expect {stock_picker(arr)}.not_to raise_error
    end

    it "should return pair of maximum profit" do
        expect(stock_picker(arr)).to eq([0, 2])
    end

    it "should not time travel" do
        expect(stock_picker([100, 0, 1])).to eq([1, 2])
    end
end

