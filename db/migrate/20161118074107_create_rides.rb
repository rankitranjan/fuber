class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.boolean :status
      t.decimal :droplat, :precision => 15, :scale => 10
      t.decimal :droplng, :precision => 15, :scale => 10
      t.datetime :time_taken
      t.references :car, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
