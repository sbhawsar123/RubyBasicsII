module Calculate

  def self.result(quant, price, rate1, rate2)
    quant * price * (100 + rate1 ) * ( 100 + rate2 ) / 10000
  end
end
