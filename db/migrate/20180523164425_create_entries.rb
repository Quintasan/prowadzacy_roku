# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :contest, foreign_key: true
      t.references :contestant, foreign_key: true

      t.timestamps
    end

    add_index(:entries, %i[contestant_id contest_id], unique: true)
  end
end
