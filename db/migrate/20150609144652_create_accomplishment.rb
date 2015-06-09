class CreateAccomplishment < ActiveRecord::Migration
  def change
    create_table :accomplishments do |t|
      t.integer :owner_id
      t.string :owner_type
      t.text :description
      t.integer :display_order
    end
  end
end
