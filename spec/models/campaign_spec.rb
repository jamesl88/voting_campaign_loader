require 'spec_helper'

describe Campaign do
  before(:each) do

    @vote1 = FactoryGirl.create(:vote, :campaign_id => '1')
    @vote2 = FactoryGirl.create(:vote, :campaign_id => '1')
    
    @vote3 = FactoryGirl.create(:vote, 
      :campaign_id => '1', 
      :validity => 'pre') 

    @candidate1 = FactoryGirl.create(:candidate,:name => 'Jenny')
    @candidate2 = FactoryGirl.create(:candidate,:name => 'James')
    @candidate3 = FactoryGirl.create(:candidate,:name => 'James')
    @campaign = FactoryGirl.create(:campaign)    

  end

  it "returns the duplicates of a candidate" do
    arr = [@candidate1.name, @candidate2.name, @candidate3.name]
    expect(Campaign.duplicate_names(arr)).to eq({'James' =>2, 'Jenny' => 1})
  end

end
