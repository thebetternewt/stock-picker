stock_prices = [10,8,6,4,2,9,7,5,3,1]

puts "Stock prices: #{stock_prices}"
puts "Number of days: #{stock_prices.length}"

# Buy = Min, Sell = Max
buy_price = stock_prices.min
buy_day = stock_prices.index(buy_price)

sell_price = stock_prices.max
sell_day = stock_prices.index(sell_price)

puts "buy_price: #{buy_price}, sell_price: #{sell_price}"
puts "buy day: #{buy_day}, sell day: #{sell_day}"

stock_prices_sorted = stock_prices.sort

index_modifier = 1
#while sell_day <= buy_day
# Don't buy on last day
  if buy_day == stock_prices.length-1
    buy_price = stock_prices_sorted[stock_prices_sorted.index(buy_price) + index_modifier]
    buy_day = stock_prices.index(buy_price)
  end
  # Don't sell on first day
  if sell_day == 0
    sell_price = stock_prices_sorted[stock_prices_sorted.index(sell_price) - index_modifier]
    sell_day = stock_prices.index(sell_price)
  end
#end

puts "new buy_price: #{buy_price}, sell_price: #{sell_price}"
puts "new buy day: #{buy_day}, sell day: #{sell_day}"
