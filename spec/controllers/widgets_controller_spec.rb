require 'rails_helper'
RSpec.describe WidgetsController do
  describe '#new' do
    it "should assign a new widget" do
      get :new
      expect(assigns(:widget)).to be_a_new Widget      
    end
  end
end