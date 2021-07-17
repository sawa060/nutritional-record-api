class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.bigint :patient_id
      t.integer :height
      t.integer :body_weight
      t.integer :systolic_blood_pressure
      t.integer :diastolic_blood_pressure
      t.integer :abdominal_circumference
      t.integer :fat_percentage
      t.integer :wbc
      t.integer :rbc
      t.integer :hb
      t.integer :haematocrit
      t.integer :t_cho
      t.integer :hdl_cho
      t.integer :ldl_cho
      t.integer :tg
      t.integer :ast
      t.integer :alt
      t.integer :gamma_gtp
      t.integer :alp
      t.integer :t_bil
      t.integer :bun
      t.integer :creatinine
      t.integer :ua
      t.integer :bs
      t.decimal :hba1c
      t.decimal :e_gfr
      t.integer :tp
      t.integer :lap
      t.decimal :che
      t.decimal :serum_amylase
      t.decimal :fe
      t.decimal :hcv
      t.decimal :cea
      t.decimal :crp
      t.decimal :mcv
      t.decimal :mch
      t.decimal :mchc
      t.text :note

      t.timestamps
    end
  end
end
