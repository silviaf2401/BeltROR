class Productsold < ActiveRecord::Base
  belongs_to :seller_id
  belongs_to :user
end
