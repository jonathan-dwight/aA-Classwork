require "rspec"
require "hanoi"

describe "Hanoi" do

    subject(:game) {Hanoi.new(3)}
    let(:initial) {[[3, 2, 1], [], []]}
    #let(:winning) {[[], [], [3, 2, 1]]}

    describe "initialize" do
        it "should initialize correctly" do
            expect(game.towers).to eq(initial)
        end
    end

    # instance method of Hanoi

    describe "won?" do
        
        it "should detect a victory" do
            
            expect(game.won?).to eq(false)

            towers = game.towers
            towers.push(towers.shift)
            
            expect(game.won?).to eq(true)
        end
    end

    #move(x, y) : move top from tower to to on tower y

    describe "move" do
        it "should move properly" do
            game.move(0, 1)
            expect(game.towers).to eq([[3, 2], [1], []])
        end

        it "won't do an illegal move" do 
            game.move(0,1)
            game.move(0,1)
            expect(game.towers).to eq([[3, 2], [1], []])
        end
    end
end