# frozen_string_literal: true

class AddStudentsDataToFixtures < ActiveRecord::Migration[5.2]
  def change
    add_column :fixtures, :students_data, :jsonb
  end
end
