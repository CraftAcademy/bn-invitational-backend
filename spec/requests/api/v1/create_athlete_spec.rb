RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'POST /api/v1/athletes' do
    let(:document) { JSON.parse(response.body)}
    let(:object) {document['status']}

    it 'should return success message if athlete is created' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26, home: 'Onsala'
      }

      expect(object).to eq 'Athlete successfully created!'
    end

    it 'should create a result for the athlete' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26, home: 'Onsala'
      }

      result = Result.first
      athlete = Athlete.first
      expect(result.athlete_id).to eq athlete.id
    end

    it 'should return success message if athlete is created' do
      post '/api/v1/athletes', params: {
        name: 'Holger Tidemand', age: 26
      }

      expect(object).to eq 'Please fill in all fields.'
    end
  end
end
