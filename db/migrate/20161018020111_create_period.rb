class CreatePeriod < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.integer :owner_id
      t.string :owner_type
    end
  end
end
