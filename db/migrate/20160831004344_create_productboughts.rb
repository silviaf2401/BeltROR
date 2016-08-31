class CreateProductboughts < ActiveRecord::Migration
  def change
    create_table :productboughts do |t|
      t.string :name
      t.float :price
      t.integer :seller_id
      t.references :buyer_id, index: true

      t.timestamps
    end
  end
end
