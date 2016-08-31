class CreateProductsolds < ActiveRecord::Migration
  def change
    create_table :productsolds do |t|
      t.string :name
      t.float :price
      t.integer :buyer_id
      t.references :seller_id, index: true

      t.timestamps
    end
  end
end
