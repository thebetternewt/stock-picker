stock_prices = [10,8,6,4,2,9,7,5,3,1]

stock_prices_sorted = stock_prices.sort
buy_price = stock_prices_sorted.min
sell_price = stock_prices_sorted.max

puts "buy_price: #{buy_price}, sell_price: #{sell_price}"
puts "buy day: #{stock_prices.index(buy_price)}, sell day: #{stock_prices.index(sell_price)}"
