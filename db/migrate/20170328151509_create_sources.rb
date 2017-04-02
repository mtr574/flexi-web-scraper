class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :url
      t.timestamp :last_run_at

      t.timestamps null: false
    end
  end
end
