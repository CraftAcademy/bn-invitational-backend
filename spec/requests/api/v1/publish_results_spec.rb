RSpec.describe Api::V1::ResultsController, type: :request do
  describe 'GET api/v1/results' do
    let!(:athlete) { create(:athlete) }
    let!(:result) { create( :result, athlete: athlete) }
    let(:object) { JSON.parse(response.body)}

    it 'should return a list of all results' do
      get '/api/v1/results'
      expected_response = eval(file_fixture('results.txt').read)
      expect(object).to eq expected_response
    end
  end
end
