class CreateSelectors < ActiveRecord::Migration
  def change
    create_table :selectors do |t|
      t.integer :source_id
      t.string :host
      t.string :value

      t.timestamps null: false
    end
  end
end
