class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :name
      t.string :date
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
