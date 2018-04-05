require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'DB Table' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :home}
    it {is_expected.to have_db_column :age}
    it {is_expected.to have_db_column :starttime}
    it {is_expected.to have_db_column :has_raced}
  end

  describe 'Factory' do
    it 'to be vaild' do
      expect(create(:athlete).valid?).to eq true
    end
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :age}
    it {is_expected.to validate_presence_of :home}
  end
end
