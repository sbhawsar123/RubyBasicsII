class SalesTax
   item = ""
   total = 0
   salesTax = 0
   def generateSlip(str,n)
     for i in 1..n
          arr = str[i].split(" ")
          quant = arr[0].to_i
          price = arr[-1].to_f
          if arr.length==4
            item = arr[1]
          else
            for j in 1..arr.length-3
              item += arr[j] + " "
            end
          end
          getValue(quant, price, item)
      end
      puts "  Sales Taxes: #{salesTax.round(2)}"
      puts "  Total: #{total.round(2)}"
   end
   def getValue(quant, price, item)
       if item.include?("imported")
           if item.include?("book") || item.include?("chocolate") || item.include?("headache pills")
                 val = ( quant * price * 105.00 / 100).round(2)
                 total += val
                 salesTax += ( val - price )
                 puts (" #{quant} #{item} : #{val}")
           else
                 val = ( quant * price * 105.0 * 110.0 / 10000 ).round(2)
                 total += val
                 salesTax += ( val - price )
                 puts(" #{quant} #{item} : #{val}")
           end
       else
           if item.include?("book") || item.include?("chocolate") || item.include?("headache pills")
                val = quant * price
                total = total + val
                salesTax += ( val - price )
                puts (" #{quant} #{item} : #{val}")
           else
                val = ( quant * price * 110.00 / 100 ).round(2)
                total += val
                salesTax += ( val - price )
                puts(" #{quant} #{item} : #{val}")
           end
        end
     end
end
n = gets.chomp.to_i
str = []
for i in 1..n
 str[i] = gets.chomp
end
obj = SalesTax.new
obj.generateSlip(str, n)
