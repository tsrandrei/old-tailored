# frozen_string_literal: true

class ImportController < ApplicationController
  def index
    @candidates = Candidate.all
  end
end
