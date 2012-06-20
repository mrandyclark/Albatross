class ScorecardController < ApplicationController
  
  def index
  end
  
  def start_round
    @player_ids = params[:players]
    
    # save players to the session, start the round
    
    redirect_to :action => "hole", :players => @player_ids 
  end
  
  def hole
    @hole_number = params[:hole_number] || 1
    @player_ids = params[:player_ids] || [1]
  end
end
