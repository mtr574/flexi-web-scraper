class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :title
      t.string :author
      t.float :stars
      t.string :body

      t.timestamps null: false
    end
  end
end
