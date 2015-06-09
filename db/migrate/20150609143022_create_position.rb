class CreatePosition < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :company
      t.string :title
      t.datetime :date_start
      t.datetime :date_end
    end
  end
end
