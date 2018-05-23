class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :token, null: false
      t.boolean :cast, null: false, default: false
      t.string :email, null: false
      t.references :contest, foreign_key: true
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
