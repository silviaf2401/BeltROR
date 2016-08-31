class CreateProductsellings < ActiveRecord::Migration
  def change
    create_table :productsellings do |t|
      t.string :name
      t.float :price
      t.references :seller_id, index: true

      t.timestamps
    end
  end
end
