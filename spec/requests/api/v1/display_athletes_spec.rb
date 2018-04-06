
RSpec.describe Api::V1::AthletesController, type: :request do
  describe 'GET /api/v1/athletes' do
    let!(:athlete) { create(:athlete) }
    let(:object) { JSON.parse(response.body) }
    before do
      #  athlete.image.attach(io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'attachment.jpg', content_type: 'image/jpg')
    end

    it 'Should return a list of all athletes' do
      get '/api/v1/athletes'
      expected_response = eval(file_fixture('athlete_list.txt').read)
      expect(object).to eq expected_response
    end

    it 'Should return a specific athlete' do
      get "/api/v1/athletes/#{athlete.id}"
      expected_response = eval(file_fixture('athlete.txt').read)
      expect(object).to eq expected_response
    end
    it 'GET /api/v1/athletes' do
      athlete.image.attach(io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'attachment.jpg', content_type: 'image/jpg')
        get "/api/v1/athletes/#{athlete.id}"
        binding.pry
       expect(object).to have_attribute(:image)
     end
  end

    #describe 'should have an image' do
    #  let!(:athlete) { create(:athlete) }
    #  let(:object) { JSON.parse(response.body) }
    #  before do
    #    athlete.image.attach(io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'attachment.jpg', content_type: 'image/jpg')
    #  end

  # it 'GET /api/v1/athletes' do
  #     get "/api/v1/athletes/#{athlete.id}"
  #     binding.pry
  #    expect(object).to have_attribute(:image)
  #  end
#  end
end
