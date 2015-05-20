require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { FactoryGirl.create(:user, first_name:'Jim', last_name:'Apple') }
  it "has a name" do
    expect(my_user.name).to eq("Jim Apple")
  end
end
