class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.decimal :picklat, :precision => 15, :scale => 10
      t.decimal :picklng, :precision => 15, :scale => 10
      t.references :car, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
