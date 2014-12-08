class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|

      t.timestamps null: false
    end
  end
end
