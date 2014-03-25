class Collection < ActiveRecord::Base
  belongs_to :community
  has_many :item
end
