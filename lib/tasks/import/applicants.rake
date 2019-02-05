require 'importers/applicants_importer.rb'

namespace :import do
  desc 'Import jobs and candidates (applicants) from a CSV file'
  task applicants: :environment do
    Importers::ApplicantsImporter.new(file).import
  end
end