require 'rails_helper'

RSpec.describe School, type: :model do
  context 'validation' do
    ["name", "city", "state", "zipcode", "phone"].each do |field|
      it "should be invalid if #{field} is not present" do
        FactoryGirl.build(:school, "#{field}".to_sym => nil).should_not be_valid
      end
    end

    it { should validate_presence_of :name }

    # let(:school) {FactoryGirl.create(:school)}

    # it { should validate_numericality_of(:phone) }
  end
end
