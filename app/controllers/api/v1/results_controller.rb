class Api::V1::ResultsController < ApplicationController
  def index
    render json: sorted_results, status: :ok
  end

  private
  def sorted_results
    results = Result.all
    sorted_results = results.sort_by { |result| result[:score] }.reverse
    sorted_results.each { |result| result.valid_score = true if result.number_of_votes > 4 }
    sorted_results
  end
end
