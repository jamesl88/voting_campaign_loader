FactoryGirl.define do 
  factory :candidate do |candidate|
    name "John"
    candidate.sequence(:campaign_id) { |id| id }
  end
end
