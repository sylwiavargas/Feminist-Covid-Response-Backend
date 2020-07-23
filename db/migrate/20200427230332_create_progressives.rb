class CreateProgressives < ActiveRecord::Migration[6.0]
  def change
    create_table :progressives do |t|
      t.string :name

      t.timestamps
    end
  end
end
