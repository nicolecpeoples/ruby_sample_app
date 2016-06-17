require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      
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
