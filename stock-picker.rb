stock_prices = [10,8,6,4,2,9,7,5,3,1]

puts stock_prices.length

buy_price = stock_prices.min
buy_day = stock_prices.index(buy_price)

sell_price = stock_prices.max
sell_day = stock_prices.index(sell_price)

puts "buy_price: #{buy_price}, sell_price: #{sell_price}"
puts "buy day: #{buy_day}, sell day: #{sell_day}"


while sell_day <= buy_day
  if sell_day == 0
    sell_day = stock_prices.length-1
    sell_price = stock_prices[sell_day]
  elsif buy_day == stock_prices.length-1
    puts "yes"
    buy_day = 0
    buy_price = stock_prices[buy_day]
  end
end

puts "new buy_price: #{buy_price}, sell_price: #{sell_price}"
puts "new buy day: #{buy_day}, sell day: #{sell_day}"
