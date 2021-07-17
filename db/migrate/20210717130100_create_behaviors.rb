class CreateBehaviors < ActiveRecord::Migration[6.1]
  def change
    create_table :behaviors do |t|
      t.bigint :patient_id
      t.string :smoking
      t.string :drinking
      t.string :exercise_habits
      t.string :breakfast
      t.string :sleeping

      t.timestamps
    end
  end
end
