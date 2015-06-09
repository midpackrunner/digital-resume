class CreateDegree < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :university
      t.string :degree
      t.datetime :date_start
      t.datetime :date_end
    end
  end
end
