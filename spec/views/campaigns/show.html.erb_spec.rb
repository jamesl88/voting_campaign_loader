require 'spec_helper'

describe "campaigns/show.html.erb" do
  
  before(:each) do

    # The vote connects the campaign and the candidate

    @vote1 = FactoryGirl.create(:vote)
    
    @vote2 = FactoryGirl.create(:vote, 
      :candidate_id => '2', 
      :validity => 'pre') 

    @candidate = FactoryGirl.create(:candidate,:name => 'Jenny')
    @candidate2 = FactoryGirl.create(:candidate,
      :id => 2,
      :name => 'John')
    @campaign = FactoryGirl.create(:campaign)

  end

  it "displays the campaign names" do

    visit campaign_path(@campaign)
    expect(page).to have_text('Campaign: Campaign-example')
    expect(page).to have_text('Error')
  end

  it "displays the candidate names" do

    visit campaign_path(@campaign)
    expect(page).to have_text('Jenny')
    expect(page).to have_text('John')

  end
end
