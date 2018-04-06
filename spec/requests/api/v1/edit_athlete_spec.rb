RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'put /api/v1/athletes/#{athlete.id}' do
    let!(:athlete) { create(:athlete) }
    let(:document) { JSON.parse(response.body)}
    let(:object) {document['status']}

    it 'Should return success message if athlete is edited' do
      put "/api/v1/athletes/#{athlete.id}", params: {
        name: 'Lara Thordardottir', age: 66, home: 'Reykjavik'
       }
      expect(object).to eq 'Athlete updated successfully!'
    end
  end
end
