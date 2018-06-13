class Store < ActiveRecord::Base
  belongs_to :Image
  belongs_to :user 
end
