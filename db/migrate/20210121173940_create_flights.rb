class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.string :flightno
      t.string :planno
      t.string :planename
      t.string :fromairport
      t.string :toairport
      t.references :user, null: false, foreign_key: true
      t.integer :totalseats
      t.datetime :departure
      t.datetime :arrival
      
      t.timestamps
    end
  end
end
