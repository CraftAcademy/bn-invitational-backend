RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'POST /api/v1/athletes' do
    let(:document) { JSON.parse(response.body) }
    let(:object) { document['status'] }
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    before do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26, home: 'Onsala'
      }, headers: headers
    end

    it 'Should return success message if athlete is created' do
      expect(object).to eq 'Athlete successfully created!'
    end

    it 'Should create a result for the athlete' do
      result = Result.first
      athlete = Athlete.first
      expect(result.athlete_id).to eq athlete.id
    end

    it 'Should return error message if not all fields are entered' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26
      }, headers: headers
      expect(object).to eq 'Please fill in all fields.'
    end
  end
end
