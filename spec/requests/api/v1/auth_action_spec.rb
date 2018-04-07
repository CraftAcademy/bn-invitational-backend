RSpec.describe Api::V1::AthletesController, type: :request do
    describe 'User tries to create/edit/destroy athlete without being auth' do
      let!(:athlete) {create(:athlete)}
      let!(:user){create(:user)}
      let(:response_json){ JSON.parse(response.body)}

      it 'should return error for create' do
        post "/api/v1/athletes", params: {
            name: 'Holger Tidemand', age: 26, home: 'Onsala'
         }

         expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end

      it 'should return error for Destroy' do
        delete "/api/v1/athletes/#{athlete.id}"

         expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end

      it 'should return error for edit' do
        get "/api/v1/athletes/#{athlete.id}/edit", params: {
          name: 'Lara Thordardottir', age: 66, home: 'Reykjavik'
         }

        expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end


    end
end
