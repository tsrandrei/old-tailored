class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :job_id
      t.references :candidate_id
      t.string :submission_date

      t.timestamps
    end
  end
end
