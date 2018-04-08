require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'DB Table' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :home}
    it {is_expected.to have_db_column :age}
    it {is_expected.to have_db_column :starttime}
    it {is_expected.to have_db_column :hasraced}
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

  describe 'Attachment' do
    it 'is valid ' do
      subject.image.attach(io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'attachment.jpg', content_type: 'image/jpg')
      expect(subject.image).to be_attached
    end
  end
end
