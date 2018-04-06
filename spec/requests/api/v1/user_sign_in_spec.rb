RSpec.describe 'User sign in', type: :request do
  let!(:user) { create(:user) }
  # let(:credentials) { user.create_new_auth_token }
  # let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
  let(:object) {JSON.parse(response.body)}


  it 'should return User on successfully sign in' do
    post '/api/v1/auth/sign_in', params: {
       email: 'tidemand@holger.se', password: 'password'
       }, headers: headers
    
    expected_response = eval(file_fixture('user.txt').read)
    expect(object).to eq expected_response

  end


end
