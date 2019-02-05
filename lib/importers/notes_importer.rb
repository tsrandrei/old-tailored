# frozen_string_literal: true

require 'csv'

module Importers
  class NotesImporter
    class InvalidNoteError < StandardError; end

    # def initialize(file)
    #   @file = file
    # end

    def import
      # Candidate.destroy_all
      # ActiveRecord::Base.connection.execute("TRUNCATE candidates")
      CSV.foreach(Rails.root + 'app/data/notes.csv', headers: true) do |line|
        Note.create!(
          candidate_id_id: find_candidate(line),
          note: line['Note'])
      rescue InvalidNoteError => exception
        puts "Applicant email address not correctly formatted"
      end
    end

    private

    def find_candidate(line)
      Candidate.where(email: line['Email'])
    end
  end
end

