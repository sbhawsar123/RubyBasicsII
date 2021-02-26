module Calc
 def Calc.result(quant, price, rate1, rate2)
    return quant * price * (100 + rate1 ) * ( 100 + rate2 ) / 10000
 end
end
