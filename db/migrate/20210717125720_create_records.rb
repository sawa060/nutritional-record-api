class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.bigint :user_id
      t.bigint :patient_id
      t.text :subjective
      t.text :objective
      t.text :assessment
      t.text :plan
      t.text :note

      t.timestamps
    end
  end
end
