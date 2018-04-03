
RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'GET /api/v1/athletes' do
    let!(:athlete) { create(:athlete) }
    let(:object) { JSON.parse(response.body)}

      it 'Should return a list of all athletes' do
      get '/api/v1/athletes'
      expected_responed = eval(file_fixture('athlete_list.txt').read)
      expect(object).to eq expected_responed
    end
  end
end
