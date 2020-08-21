require "remove_dups"
require 'rspec'

describe "my_uniq" do

    let(:arr) {[5, 5, 6, 7, 8, 7, 8, 8]}

    it "accepts array as argument" do
        expect {my_uniq([1,2,3,4])}.not_to raise_error
    end

    it "returns array" do
        expect(my_uniq([1,2,3,4]).is_a?(Array)).to eq(true)
    end

    it "returns new array" do
        expect(my_uniq(arr)).not_to be(arr)
        # expect(my_uniq(arr).object_id == arr.object_id).to eq(false)
    end

    it "actually removes duplicates" do
        expect(my_uniq(arr)).to eq([5,6,7,8])
    end

    it "doesn't affect already unique array" do
        expect(my_uniq([1, 2, 3, 4])).to eq([1,2,3,4])
    end

    it "handles empty array appropriately" do
        expect(my_uniq([])).to eq([])
    end


    
end



