class CreateResumesPositions < ActiveRecord::Migration
  def change
    create_join_table :resumes, :positions do |t|
      t.index :resume_id
      t.index :position_id
    end
  end
end
