RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'get /api/v1/athletes/#{athlete.id}/edit' do
    let!(:athlete) { create(:athlete) }
    let(:response_json) { JSON.parse(response.body)}
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    it 'Should return success message if athlete is edited' do
      get "/api/v1/athletes/#{athlete.id}/edit", params: {
        name: 'Lara Thordardottir', age: 66, home: 'Reykjavik'
      }, headers: headers

      expect(response_json['status']).to eq 'Athlete updated successfully!'
    end
  end
end
