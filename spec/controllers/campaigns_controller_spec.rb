require 'spec_helper'

describe CampaignsController do

  describe 'GET #index' do

    before(:each) { get :index }

    it 'responds sucessfully to an http 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do 
      expect(response).to render_template("index")
    end

    it 'loads all of the campaigns into @campaigns' do
      campaign1, campaign2 = Campaign.create!, Campaign.create!
      expect(assigns(:campaigns)).to match_array([campaign1,campaign2])
    end
  end

  describe "GET 'show'" do

    it "renders the show template" do
      campaign = FactoryGirl.create(:campaign)
      get :show, id: campaign

      expect(response).to render_template("show")
    end

  end
end
