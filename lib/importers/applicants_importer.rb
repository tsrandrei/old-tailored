# frozen_string_literal: true

require 'csv'

module Importers
  class ApplicantsImporter
    class InvalidApplicantEmailError < StandardError; end

    # def initialize(file)
    #   @file = file
    # end

    def import
      # Candidate.destroy_all
      # ActiveRecord::Base.connection.execute("TRUNCATE candidates")
      CSV.foreach(Rails.root + 'app/data/candidates.csv', headers: true) do |line|
        raise InvalidApplicantEmailError unless line['E-mail'].match(URI::MailTo::EMAIL_REGEXP)

        JobApplication.create!(
          candidate_id: find_or_create_candidate(line).id,
          job_id: find_or_create_job(line).id
        )
      rescue InvalidApplicantEmailError
        p 'Invalid record :' + line.to_s
      end
    end

    private

    def find_or_create_candidate(line)
      Candidate.where(email: line['E-mail']).first || create_candidate(line)
    end

    def create_candidate(line)
      raise InvalidApplicantEmailError unless
          line['E-mail'].match(URI::MailTo::EMAIL_REGEXP)

      Candidate.create!(
        full_name: line['Name'],
        email: line['E-mail'],
        phone: line['Phone'],
        note: nil,
        created_at: line['Created at']
      )
    end

    def find_or_create_job(line)
      Job.where(candidate_id: line['E-mail']).first || create_job(line)
    end

    def create_job(line)
      Job.create!(
        title: line['Job'],
        candidate_id: Candidate.where(email: line['E-mail']).first.id
      )
    end
  end
end
