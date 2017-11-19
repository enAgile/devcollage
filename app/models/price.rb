class Price
  include ActiveModel::Model
  attr_accessor *%i(price ammount currency)

  alias to_s price
end
