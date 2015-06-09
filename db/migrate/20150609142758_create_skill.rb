class CreateSkill < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :resume
      t.string :name
      t.integer :level, default: 1 # thinking x / 5, but may drop later
      t.timestamps
    end
  end
end
