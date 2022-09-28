# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min_price = nil
  max_profit = 0
  prices.each do |price|
    if min_price.nil? || min_price > price
      min_price = price
    elsif price - min_price > max_profit
      max_profit = price - min_price
    end
  end

  max_profit
end

p max_profit([7, 1, 5, 3, 6, 4])
p max_profit([7, 6, 4, 3, 1])
