require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'DB Table' do
    it {is_expected.to have_db_column :score}
    it {is_expected.to have_db_column :rating_collection}
    it {is_expected.to have_db_column :number_of_votes}
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

  describe 'class methods' do
    let!(:athlete) { create(:athlete) }
    let!(:athlete_2) { create(:athlete, name: 'Lara') }
    let!(:athlete_3) { create(:athlete, name: 'Kalle') }
    let!(:result) { create( :result, athlete: athlete_2, score: 9.5) }
    let!(:result_2) { create( :result, athlete: athlete, score: 10.0) }
    let!(:result_3) { create( :result, athlete: athlete_3, score: 5.0, number_of_votes: 5) }
    let(:all_results) { Result.all }

    it 'Publish Results - should turn has_raced to true for all' do
      Result.publish_results
      all_results.each do |result|
        expect(result.has_raced).to eq true
      end
    end
      it 'Revert Results - should turn has_raced to false for all' do
        Result.publish_results
        Result.revert_results
        all_results.each do |result|
          expect(result.has_raced).to eq false
        end
      end
    end
  end
