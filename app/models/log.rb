class Log < ActiveRecord::Base
  belongs_to :client
  belongs_to :product

  paginates_per 50

  def client_name
    client.try(:name)
  end

  def product_name
    product.try(:name)
  end
end
