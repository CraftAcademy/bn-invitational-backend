require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'DB Table' do
    it {is_expected.to have_db_column :score}
    it {is_expected.to have_db_column :rating_collection}
    it {is_expected.to have_db_column :numberofvotes}
  end

  describe 'Factory' do
    it 'to be vaild' do
      athlete = create(:athlete)
      expect(create(:result, athlete: athlete).valid?).to eq true
    end
  end

    describe 'Assosiation' do
      it {is_expected.to belong_to :athlete}
    end
end
