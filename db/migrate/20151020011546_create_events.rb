class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.string :name
      t.date :date
      t.string :location
      t.string :state

      t.timestamps
    end
  end
end
