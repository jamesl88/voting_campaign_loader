require 'spec_helper'

describe VotesController do
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

    it 'loads all of the votes into @votes' do
      vote1, vote2 = Vote.create!, Vote.create!
      get :index

      expect(assigns(:votes)).to match_array([vote1,vote2])
    end
  end
end
