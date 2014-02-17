class Campaign < ActiveRecord::Base
  has_many :votes
  has_many :candidates, through: :votes

  def self.duplicate_names(arr)
    arr.inject(Hash.new(0)) { |result, element| result[element] += 1 ; result }   
  end
end
