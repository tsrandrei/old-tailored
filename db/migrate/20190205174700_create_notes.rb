class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :candidate_id
      t.text :note

      t.timestamps
    end
  end
end
