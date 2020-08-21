class CreateEventAttendes < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendes do |t|

      t.timestamps
    end
  end
end
