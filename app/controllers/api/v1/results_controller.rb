class Api::V1::ResultsController < ApplicationController
    def index
      results = Result.all
      render json: results, status: :ok 
    end
end
