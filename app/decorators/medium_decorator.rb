module MediumDecorator
  def price
    number_to_currency(price_amount * 1.08, unit: price_currency == 'JPY' ? '¥' : '$', precision: 0)
  end
end
