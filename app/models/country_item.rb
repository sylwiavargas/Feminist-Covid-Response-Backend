class CountryItem < ApplicationRecord
  belongs_to :item
  belongs_to :country
end
