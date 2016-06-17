require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
      assert_response :success
      
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      assert_response :success
      
    end
  end

   describe "GET #about" do
    it "returns http success" do
      get :about
      assert_response :success
     
    end
  end



end
