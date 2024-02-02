class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.string :role
      t.string :avatar

      t.timestamps
    end
  end
end
