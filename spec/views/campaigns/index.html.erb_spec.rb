require 'spec_helper'

describe "campaigns/index.html.erb" do
  before(:each) do
    campaign = Campaign.create!(:name => 'Campaign1', )

  end

  it "displays the campaign names" do
    visit "/"
    expect(page).to have_text('Campaign1')
  end

#   pending "add some examples to (or delete) #{__FILE__}"
end
