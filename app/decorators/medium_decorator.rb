module MediumDecorator
  def price
    number_to_currency(price_amount, unit: price_currency == 'JPY' ? '¥' : '$', precision: 0)
  end
end
