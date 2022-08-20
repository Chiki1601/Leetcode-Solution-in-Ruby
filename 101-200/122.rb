def max_profit(prices)
  profit = 0
  bought = nil
  prices.each_with_index do |price, index|

    if bought.nil? && index < prices.length - 1  && price < prices[index + 1]
      bought = price
      next
    end
    if !bought.nil? && index < prices.length - 1 && price > prices[index + 1]
      profit = profit + price - bought
      bought = nil
    end

    if !bought.nil? && (index == prices.length - 1)
      profit = profit + price - bought
      bought = nil
    end
  end

  profit
end

p max_profit [7, 1, 5, 3, 6, 4]
p max_profit [1, 2, 3, 4, 5]
