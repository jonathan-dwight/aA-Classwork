require "rspec"
require "my_transpose"

describe "my_transpose" do

    let(:matrix) {[[1, 2, 3],[4, 5, 6]]}

    it "takes matrix (2d array) as argument" do
        expect{my_transpose(matrix)}.not_to raise_error
    end

    it "returns matrix with transposed dimensions" do
        expect(my_transpose(matrix).length == 3).to eq(true)
        expect(my_transpose(matrix)[0].length == 2).to eq(true)
    end

    it "actually transposes values" do
        expect(my_transpose(matrix)).to eq([[1,4], [2,5], [3, 6]])
    end

    it "handles empty matrix" do
        expect(my_transpose([])).to eq([])
    end

end

