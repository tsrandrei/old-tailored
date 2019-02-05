class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :candidate_id

      t.timestamps
    end
  end
end
