# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :job
      t.references :candidate
      t.string :submission_date

      t.timestamps
    end
  end
end
