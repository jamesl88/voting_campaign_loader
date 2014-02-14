class Vote < ActiveRecord::Base
  belongs_to :campaigns
  has_one :candidate
end
