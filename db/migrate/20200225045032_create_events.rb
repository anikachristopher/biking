class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.timestamp :time
      t.integer :user_id
    end
  end
end
