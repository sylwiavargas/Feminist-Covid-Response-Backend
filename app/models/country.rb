class Country < ApplicationRecord
    has_many :country_items
    has_many :items, through: :country_items

    validates_presence_of :name 
end
