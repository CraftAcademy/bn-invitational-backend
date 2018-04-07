RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'POST /api/v1/athletes' do
    let(:document) { JSON.parse(response.body)}
    let(:object) {document['status']}
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    it 'should return success message if athlete is created' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26, home: 'Onsala'
      }, headers: headers

      expect(object).to eq 'Athlete successfully created!'
    end

    it 'should create a result for the athlete' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26, home: 'Onsala'
      }, headers: headers

      result = Result.first
      athlete = Athlete.first
      expect(result.athlete_id).to eq athlete.id
    end

    it 'should return success message if athlete is created' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26
      }, headers: headers

      expect(object).to eq 'Please fill in all fields.'
    end
  end
end
