# frozen_string_literal: true

require 'csv'

module Importers
  class ApplicantsImporter
    def initialize(file)
      @file = file
    end

    def import
      # Candidate.destroy_all
      # ActiveRecord::Base.connection.execute("TRUNCATE candidates")
      CSV.foreach(Rails.root + 'app/data/candidates.csv', headers: true) do |line|
        Candidate.create!(
          full_name: line['Name'],
          email: line['E-mail'],
          phone: line['Phone']
        )
        puts line['Name']
      end
    end
  end
end
