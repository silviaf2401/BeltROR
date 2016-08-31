class Productbought < ActiveRecord::Base
  belongs_to :buyer_id
  belongs_to :user
end
