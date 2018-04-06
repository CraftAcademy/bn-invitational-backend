RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'delete /api/v1/athletes/#{athlete.id}' do
    let!(:athlete) { create(:athlete) }
    let(:document) { JSON.parse(response.body)}
    let(:object) {document['status']}

    it 'Should return success message if athlete is deleted' do
      delete "/api/v1/athletes/#{athlete.id}"
      expect(object).to eq 'Athlete successfully deleted!'
    end
  end
end
