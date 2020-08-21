# Strategy #1 : try every pair, return pair w/ most profit

# Strategy #2: keep track, for every day, of the minimum price so far
    # minimum_price_on_day_x = [minimum price the day before, today's price].min
    # maximum price if sell on day x
    # maximum profit so far = [maximum profit on day x-1, price-x - min-price(x)]

         #[1,10,3,3,4]
#min     #[1,1,1,1,1]
#profit  #[x,9, 2, 2, 3] answer = 9

# Tests for stock-picker
# (1) take an array of prices (done)
# (2) actually returns highest profit day (done)
# (3) no time travel stock trades

    # (100, 0, 1) [1,0] (impossible bc)


def stock_picker(prices)

    max_profit = 0
    max_pair = []
    (0...prices.length).each do |i|
        (i+1...prices.length).each do |j|
            if prices[j]-prices[i] > max_profit
                max_profit = prices[j]-prices[i]
                max_pair = [i, j]
            end
        end
    end
    max_pair
end