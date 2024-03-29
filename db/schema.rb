# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_205_174_700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'candidates', force: :cascade do |t|
    t.string 'full_name'
    t.string 'email'
    t.string 'phone'
    t.text 'note'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'job_applications', force: :cascade do |t|
    t.bigint 'job_id'
    t.bigint 'candidate_id'
    t.string 'submission_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['candidate_id'], name: 'index_job_applications_on_candidate_id'
    t.index ['job_id'], name: 'index_job_applications_on_job_id'
  end

  create_table 'jobs', force: :cascade do |t|
    t.string 'title'
    t.bigint 'candidate_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['candidate_id'], name: 'index_jobs_on_candidate_id'
  end

  create_table 'notes', force: :cascade do |t|
    t.bigint 'candidate_id'
    t.text 'note'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['candidate_id'], name: 'index_notes_on_candidate_id'
  end
end
