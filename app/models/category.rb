class Category < ApplicationRecord
    has_many :category_items
    has_many :items, through: :category_items

    validates_presence_of :name 
end
