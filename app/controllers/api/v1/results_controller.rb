class Api::V1::ResultsController < ApplicationController
    def index
      results = Result.all
      results.sort_by {|result| result.score}
      binding.pry
      render json: results, status: :ok
    end
end
