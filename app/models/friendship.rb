class Friendship < ActiveRecord::Base
  attr_accessible :accepter, :sender, :status
end
