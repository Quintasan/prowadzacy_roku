# frozen_string_literal: true

class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures do |t|
      t.jsonb :file_data

      t.timestamps
    end
  end
end
