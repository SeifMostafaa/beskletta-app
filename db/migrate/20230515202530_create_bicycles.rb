class CreateBicycles < ActiveRecord::Migration[7.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :style
      t.string :photo

      t.timestamps
    end
  end
end
