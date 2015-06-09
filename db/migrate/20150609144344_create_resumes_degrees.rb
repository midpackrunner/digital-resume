class CreateResumesDegrees < ActiveRecord::Migration
  def change
    create_join_table :resumes, :degrees do |t|
      t.index :resume_id
      t.index :degree_id
    end
  end
end
