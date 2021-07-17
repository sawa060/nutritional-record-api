class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :sex
      t.string :email
      t.string :phone_number
      t.bigint :number

      t.timestamps
    end
  end
end
