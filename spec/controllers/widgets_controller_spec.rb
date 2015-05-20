require 'rails_helper'

RSpec.describe WidgetsController do

  describe "#index" do
    it "show load a list of widgets" do
      get :index
      expect(assigns(:widgets)).to eq(Widget.all)
    end
  end

  describe "#new" do
     it "should assign a new widget" do
      get :new
      expect(assigns(:widget)).to be_a_new Widget
     end
  end

  describe "#create" do
    it "should create a widget when params valid" do
      params = { widget:{name:'Steven'}}
      expect {post(:create, params)}.to change{Widget.count}.by(1)
    end

    it "should redirect when params valid" do
      params = { widget:{name:'Steven'}}
      post :create, params
      expect(response).to redirect_to widgets_path
    end
  end
end