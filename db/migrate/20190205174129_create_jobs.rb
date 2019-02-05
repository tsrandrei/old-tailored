# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :candidate

      t.timestamps
    end
  end
end
