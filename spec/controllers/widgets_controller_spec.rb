require 'rails_helper'
RSpec.describe WidgetsController do
  describe '#new' do
    it "should assign a new widget" do
      get :new
      expect(assigns(:widget)).to be_a_new Widget      
    end
  end

  describe '#create' do
    it "should create a widget" do
      params = {widget:{name:'Steven'}}
      expect{post(:create, params)}.to change{Widget.count}.by(1)
    end
    it "should redirect to widgets#index" do
      params = {widget:{name:'Steven'}}
      post(:create, params)
      expect(response).to redirect_to(widgets_path)
    end
  end
end