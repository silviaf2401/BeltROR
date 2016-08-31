class Productselling < ActiveRecord::Base
  belongs_to :seller_id
  belongs_to :user
  validates :name, :price, :presence => true
  validates :price, numericality: {only_float: true}

end
