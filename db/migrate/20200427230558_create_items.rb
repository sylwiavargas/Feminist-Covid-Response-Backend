class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title_en
      t.string :title_es
      t.string :title_fr
      t.string :description_en
      t.string :description_es
      t.string :description_fr
      t.string :link
      t.string :date
      t.belongs_to :progressive, null: false, foreign_key: true
      t.belongs_to :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
