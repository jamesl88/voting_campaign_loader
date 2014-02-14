class Vote < ActiveRecord::Base
  belongs_to :campaigns
  belongs_to :candidate
end
