class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :name, null: false, unique: true
      t.string :aasm_state
      t.datetime :expires_at

      t.timestamps
    end
  end
end
