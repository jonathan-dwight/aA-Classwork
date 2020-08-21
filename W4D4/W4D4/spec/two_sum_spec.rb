require 'rspec'
require 'two_sum'

describe 'two_sum' do

    let(:arr) {[5, 7, -5]}

    it "takes an array" do
        expect { two_sum([1,2,3]) }.not_to raise_error
    end

    it "returns all and only pairs" do
        expect(two_sum(arr)).to eq([[0,2]])
    end

    it "returns pairs in dictionary order" do
        expect(two_sum(arr+[-5])).to eq([[0,2],[0,3]])
    end

end
