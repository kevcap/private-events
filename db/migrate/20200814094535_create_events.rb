class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.text :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
