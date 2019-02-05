# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :candidate
      t.text :note

      t.timestamps
    end
  end
end
