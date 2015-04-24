class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :key, null: false, unique: true
      t.attachment :file
      t.timestamps
    end
  end
end
