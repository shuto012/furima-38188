class CreateDayToShips < ActiveRecord::Migration[6.0]
  def change
    create_table :day_to_ships do |t|

      t.timestamps
    end
  end
end
