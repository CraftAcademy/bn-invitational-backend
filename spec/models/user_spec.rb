RSpec.describe User, type: :model do
  describe 'Factory' do
    it "should be valid" do
      expect(create(:user).valid?).to eq true
    end
  end
  describe 'DB Table' do
    it { is_expected.to have_db_column :email}
    it { is_expected.to have_db_column :encrypted_password}
  end
end
