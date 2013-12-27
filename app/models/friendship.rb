class Friendship < ActiveRecord::Base
  attr_accessible :accepter, :sender, :status
  
  belongs_to :accepter,
  :class_name => "User",
  :foreign_key => :accepter
  
  belongs_to :requests,
  :class_name => "User", 
  :foreign_key => :sender
  
end
