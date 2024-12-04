# frozen_string_literal: true

def stock_picker(prices)
  best_day_to_buy = 0
  best_day_to_sell = 0
  max_profit = 0
  (0...(prices.length - 1)).each do |buy_day|
    ((buy_day + 1)...prices.length).each do |sell_day|
      profit = prices[sell_day] - prices[buy_day]
      next unless profit > max_profit

      max_profit = profit
      best_day_to_buy = buy_day
      best_day_to_sell = sell_day
    end
  end
  [best_day_to_buy, best_day_to_sell]
end
p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
