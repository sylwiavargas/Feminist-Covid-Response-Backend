class CreateCountryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :country_items do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
