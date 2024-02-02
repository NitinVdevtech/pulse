class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunities do |t|
      t.string :procedure_name
      t.integer :patient_id
      t.integer :doctor_id
      t.jsonb :stage, null: false, default: []

      t.timestamps
    end
  end
end
