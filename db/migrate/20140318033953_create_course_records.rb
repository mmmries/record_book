class CreateCourseRecords < ActiveRecord::Migration
  def change
    create_table :course_records do |t|
      t.integer :course_id
      t.integer :rank
      t.integer :score
      t.datetime :played_at
      t.integer :game_id
      t.integer :score_id
      t.integer :player_id
 
      t.timestamps
    end
  end
end
