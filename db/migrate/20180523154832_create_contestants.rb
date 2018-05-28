# frozen_string_literal: true

class CreateContestants < ActiveRecord::Migration[5.2]
  def change
    create_table :contestants do |t|
      t.string :name, null: false, default: ""
      t.string :surname, null: false, default: ""
      t.string :title, null: false, default: ""

      t.timestamps
    end

    add_index(:contestants, %i[name surname title], unique: true)
  end
end
