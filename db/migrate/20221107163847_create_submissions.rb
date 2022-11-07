# frozen_string_literal: true

class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.string :item
      t.string :full_name
      t.text :reflections, null: true

      t.timestamps
    end
  end
end
