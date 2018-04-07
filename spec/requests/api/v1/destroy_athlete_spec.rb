RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'delete /api/v1/athletes/#{athlete.id}' do
    let!(:athlete) { create(:athlete) }
    let(:response_json) { JSON.parse(response.body)}
    let!(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

    it 'Should return success message if athlete is deleted' do
      delete "/api/v1/athletes/#{athlete.id}", headers: headers
      expect(response_json['status']).to eq 'Athlete successfully deleted!'
    end
  end
end
