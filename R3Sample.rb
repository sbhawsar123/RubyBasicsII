$LOAD_PATH << '.'
require "Module_Demo"
times = gets.chomp.to_i
str = []
for i in 1..times
  str[i] = gets.chomp
end
total = 0
salesTax = 0
include Calc
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
    if str[i].include?("book") || str[i].include?("chocolate") || str[i].include?("headache pill")
      val = Calc.result(quant,price,5,0).round(2)
      total += val
      salesTax += ( val - price )
      puts (" #{quant} #{res} : #{val}")
    else
      val = Calc.result(quant,price,5,10).round(2)
      total += val
      salesTax += (val-price)
      puts(" #{quant} #{res} : #{val}")
    end
  else
   if str[i].include?("book") || str[i].include?("chocolate") || str[i].include?("headache pill")
       val = quant * price
       total += val
       salesTax += ( val - price )
       puts (" #{quant} #{res} : #{val}")
    else
       val = Calc.result(quant, price, 10, 0).round(2)
       total += val
       salesTax += ( val - price )
       puts(" #{quant} #{res} : #{val}")
    end
  end
end
puts " Sales Tax : #{salesTax.round(2)}"
puts " Total : #{total.round(2)}"
