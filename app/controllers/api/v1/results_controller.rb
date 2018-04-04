class Api::V1::ResultsController < ApplicationController
    def index
      results = Result.all
      sorted_results = results.sort_by {|result| result[:score]}.reverse
      render json: sorted_results, status: :ok
    end
end
