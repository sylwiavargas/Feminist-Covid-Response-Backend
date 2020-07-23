class Item < ApplicationRecord
  # after_initialize :init
  belongs_to :progressive
  belongs_to :page
  has_many :country_items
  has_many :countries, through: :country_items
  has_many :theme_items
  has_many :themes, through: :theme_items
  has_many :category_items
  has_many :categories, through: :category_items
  has_many :type_items
  has_many :types, through: :type_items

  validates_presence_of :title_en, :link

  def make_types
    self.types.length >= 1  ? self.types.map{|t| t.name} : nil 
  end

  def make_progressive
    self.progressive ? self.progressive.name : nil
  end

  def make_date
    self.date ? self.date  : nil 
  end

  def make_countries
    self.countries.length >= 1 ? self.countries.map{|c| c.name} : nil 
  end

  def make_categories
    self.categories.length >= 1 ? self.categories.map{|c| c.name} : nil 
  end

  # def init
  #   self.date = "" if self.date.nil?          #will set the default value only if it's nil
  # end
end
