def pickStocks(stocks)
  #initialize the difference hash
  stock_info = {
    sellpoint: 0,
    buypoint: 0,
    difference: 0
  }
  #loop through every stock
  stocks.each_with_index do |first_stock, index|
    #loop through every stock again
    stocks.each_with_index do |second_stock, index_two|
      #ignore if the first and second stock are the same
      if index == index_two
        next
      end
      #if the index is less than the previous stock, make the current stock the potential sell point and the other the buy point, and vice versa
      sellpoint = 0
      buypoint = 0 #keep in mind that these are *potential* buy and sell points
      if(index < index_two)
        buypoint = first_stock
        sellpoint = second_stock
      else
        buypoint = second_stock
        sellpoint = first_stock
      end
      #Subtract the buy point from the sell point and store the difference
      difference = sellpoint - buypoint
      #if the difference is greater than the previous one stored, make the stock_info hash the index of the buy point, the index of the sell point, and the difference
      if difference > stock_info[:difference]
        stock_info[:buypoint] = index
        stock_info[:sellpoint] = index_two
        stock_info[:difference] = difference
      end
    end
  end
  #return an array of the indexes to sell
  return [stock_info[:buypoint], stock_info[:sellpoint]]
end

stocks = [17,3,6,9,15,8,6,1,10]
puts(pickStocks(stocks))
