# frozen_string_literal: true

require 'importers/applicants_importer.rb'

namespace :import do
  desc 'Import jobs and candidates (applicants) from a CSV file'
  task applicants: :environment do
    # Importers::ApplicantsImporter.new(file).import
    Importers::ApplicantsImporter.new.import
  end
end
