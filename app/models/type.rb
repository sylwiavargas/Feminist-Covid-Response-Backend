class Type < ApplicationRecord
    has_many :type_items
    has_many :items, through: :type_items

    validates_presence_of :name 
end
