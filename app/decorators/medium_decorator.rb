module MediumDecorator
  def price_with_tax
    number_to_currency(price_amount * 1.08, unit: price_currency == 'JPY' ? '¥' : '$', precision: 0) + '(税込)'
  end
end
