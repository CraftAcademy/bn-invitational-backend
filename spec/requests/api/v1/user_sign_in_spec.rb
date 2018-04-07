RSpec.describe 'User sign in', type: :request do
  let!(:user) { create(:user) }
  let(:object) {JSON.parse(response.body)}

  it 'should return User on successfully sign in' do
    post '/api/v1/auth/sign_in', params: {
       email: 'tidemand@holger.se', password: 'password'
    }
    expected_response = eval(file_fixture('user.txt').read)
    expect(object).to eq expected_response
  end

  it 'should return error if invalid email' do
    post '/api/v1/auth/sign_in', params: {
      email: 'holger@tideman.se', password: 'password'
    }
    expect(object['errors'].first).to eq "Invalid login credentials. Please try again."
  end

  it 'should return error if invalid password' do
    post '/api/v1/auth/sign_in', params: {
      email: 'tidemand@holger.se', password: 'pasKlword'
    }
    expect(object['errors'].first).to eq "Invalid login credentials. Please try again."
  end
end
