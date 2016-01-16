puts
puts "Please enter in a list of stock prices separated by spaces:"
input = gets.chomp
puts

stock_prices = input.split(' ')
stock_prices.each_with_index do |price, index|
  stock_prices[index] = price.to_i
end

puts "Stock prices: #{stock_prices}"
puts "Number of days: #{stock_prices.length}"

buy_price = stock_prices.min
buy_day = stock_prices.index(buy_price)

sell_price = stock_prices.max
sell_day = stock_prices.index(sell_price)

stock_prices_sorted = stock_prices.sort.uniq

if buy_day == stock_prices.length-1 # Don't buy on last day
  buy_price = stock_prices_sorted[stock_prices_sorted.index(buy_price) + 1]
  buy_day = stock_prices.index(buy_price)
end

if sell_day == 0 # Don't sell on first day
  sell_price = stock_prices_sorted[stock_prices_sorted.index(sell_price) - 1]
  sell_day = stock_prices.index(sell_price)
end

if sell_day <= buy_day # if selling before buying...

  new_sell_price = sell_price
  new_sell_day = sell_day
  new_buy_price = buy_price
  new_buy_day = buy_day

  puts "sell_day <= buy_day"
  # check gain if sell day changed
  while new_sell_day <= buy_day
    new_sell_price = stock_prices_sorted[stock_prices_sorted.index(new_sell_price) - 1]
    new_sell_day = stock_prices.index(new_sell_price)
  end
  option1_gain = new_sell_price - buy_price
  option1_sell_price = new_sell_price
  option1_sell_day = new_sell_day

  # check gain if buy day changed
  while sell_day <= new_buy_day
    new_buy_price = stock_prices_sorted[stock_prices_sorted.index(new_buy_price) + 1]
    new_buy_day = stock_prices.index(new_buy_price)
  end
  option2_gain = sell_price - new_buy_price
  option2_buy_price = new_buy_price
  option2_buy_day = new_buy_day

  # compare options & select highest spread
  if option1_spread >= option2_spread
    sell_price = option1_sell_price
    sell_day = option1_sell_day
  else
    buy_price = option2_buy_price
    buy_day = option2_buy_day
  end

end

puts
puts "You should have bought on day #{buy_day + 1} for $#{buy_price}, and sold on "
puts "day #{sell_day + 1} for $#{sell_price}, for a gain of $#{sell_price - buy_price}"
