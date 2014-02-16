require 'spec_helper'

describe CampaignsController do

  describe 'GET #index' do
    it 'responds sucessfully to an http 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do 
      get :index
      expect(response).to render_template("index")
    end

    it 'loads all of the campaigns into @campaigns' do
      campaign1, campaign2 = Campaign.create!, Campaign.create!
      get :index

      expect(assigns(:campaigns)).to match_array([campaign1,campaign2])
    end
  end


  describe "GET 'show'" do

    before(:each) do

      @vote1 = FactoryGirl.create(:vote, :campaign_id => '1')
      @vote2 = FactoryGirl.create(:vote, :campaign_id => '1')
      
      @vote3 = FactoryGirl.create(:vote, 
        :campaign_id => '1', 
        :validity => 'pre') 

      @candidate = FactoryGirl.create(:candidate,:name => 'Jenny')
      @candidate = FactoryGirl.create(:candidate,:name => 'James')
      @candidate = FactoryGirl.create(:candidate,:name => 'Kelvin')
      @campaign = FactoryGirl.create(:campaign)    

    end

    it "renders the show template" do

      visit campaign_path(@campaign)
      expect(response).to render_template("show")
    end


  end
end
