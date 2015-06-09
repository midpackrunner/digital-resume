class CreateResume < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :key, null: false
      t.timestamps
    end

    add_index :resumes, :key, unique: true
  end
end
