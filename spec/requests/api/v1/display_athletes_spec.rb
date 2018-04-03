
RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'GET /api/v1/athletes' do
    let!(:athlete) { create(:athlete) }
    let(:object) { JSON.parse(response.body)}

    it 'Should return a list of all athletes' do
      get '/api/v1/athletes'
      binding.pry
      expected_response = eval(file_fixture('athlete_list.txt').read)
      expect(object).to eq expected_response
    end

    it 'Should return a specific athlete' do
      get "/api/v1/athletes/#{athlete.id}"
      expected_response = eval(file_fixture('athlete.txt').read)
      expect(object).to eq expected_response
    end
  end
end
