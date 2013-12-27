class FriendshipsController < ApplicationController

  def create
    
  end
  
  def new
    accepter = params[:id]
    @friendship = Friendship.create(sender: current_user.id, 
                                    accepter: accepter,
                                    status: false)
                                    
    render :json => @friendship, :status => 200
  end
  
  def destroy
    
  end
  
  def requests
    @requests = Friendship.find_all_by_accepter_and_status(current_user.id, false)
    
    @requests.map! { |user| [user.id, user.username, user.updated_at] }
    
    render :json => @requests, :status => 200
  end
  
end
