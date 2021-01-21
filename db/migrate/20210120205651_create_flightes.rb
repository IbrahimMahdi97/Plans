class CreateFlightes < ActiveRecord::Migration[6.0]
  def change
    create_table :flightes do |t|
      t.string :flightno
      t.string :planno
      t.string :planename
      t.string :fromairport
      t.string :toairport
      
      t.timestamps
    end
  end
end
