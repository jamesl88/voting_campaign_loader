FactoryGirl.define do 
  factory :vote do |vote|
    vote.sequence(:campaign_id) { |id| id}
    vote.sequence(:candidate_id) { |id| id}
    validity "during"
  end
end
