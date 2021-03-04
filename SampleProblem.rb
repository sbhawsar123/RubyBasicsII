times = gets.chomp.to_i
str = []
for i in 1..times
  str[i] = gets.chomp
end
total = 0
salesTax = 0
for i in 1..times
  res = ""
  arr = str[i].split(" ")
  quant = arr[0].to_i
  price = arr[-1].to_f
  if arr.length == 4
    res = arr[1]
  else
    for j in 1..arr.length-3
      res += arr[j] + " "
    end
  end
  if str[i].include?("imported")
    if str[i].include?("book") || str[i].include?("chocolate") || str[i].include?("headache pills")
      val = ( quant * price * 105.00 / 100).round(2)
      total += val
      salesTax += ( val - price )
      puts (" #{quant} #{res} : #{val}")
    else
      val = ( quant * price * 105.0 * 110.0 / 10000 ).round(2)
      total += val
      salesTax += ( val - price )
      puts(" #{quant} #{res} : #{val}")
    end
  else
    if str[i].include?("book") || str[i].include?("chocolate") || str[i].include?("headache pills")
      val = quant * price
      total += val
      salesTax += ( val - price )
      puts (" #{quant} #{res} : #{val}")
    else
      val = ( quant * price * 110.00 / 100 ).round(2)
      total += val
      salesTax += ( val - price )
      puts(" #{quant} #{res} : #{val}")
    end
  end
end
puts "  Sales Taxes: #{salesTax.round(2)}"
puts "  Total: #{total.round(2)}"
