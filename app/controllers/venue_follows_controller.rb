class VenueFollowsController < ApplicationController
  def index
    @venue_follows = VenueFollow.all.order({ :created_at => :desc })

    render({ :template => "venue_follows/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @venue_follow = VenueFollow.where({:id => the_id }).at(0)

    render({ :template => "venue_follows/show.html.erb" })
  end

  def create
    @venue_follow = VenueFollow.new
    @venue_follow.venue_id = params.fetch("query_venue_id")
    @venue_follow.fan_id = @current_user.id

    location = Venue.where({:id => @venue_follow.venue_id}).at(0)

    if @venue_follow.valid?
      @venue_follow.save
      redirect_to("/cities/#{location.city}", { :notice => "Get ready to rock!" })
    else
      redirect_to("/cities/#{location.city}", { :notice => "Venue follow failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @venue_follow = VenueFollow.where({ :id => the_id }).at(0)

    @venue_follow.venue_id = params.fetch("query_venue_id")
    @venue_follow.fan_id = params.fetch("query_fan_id")

    if @venue_follow.valid?
      @venue_follow.save
      redirect_to("/venue_follows/#{@venue_follow.id}", { :notice => "Venue follow updated successfully."} )
    else
      redirect_to("/venue_follows/#{@venue_follow.id}", { :alert => "Venue follow failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @venue_follow = VenueFollow.where({ :id => the_id }).at(0)

    @venue_follow.destroy

    location = Venue.where({:id => @venue_follow.venue_id}).at(0)

    redirect_to("/cities/#{location.city}", { :notice => "We get it, you're 'too' 'cool' for that place."} )
  end

  def destroy_part2
    the_id = params.fetch("path_id")
    @venue_follow = VenueFollow.where({ :id => the_id }).at(0)

    @venue_follow.destroy

    location = Venue.where({:id => @venue_follow.venue_id}).at(0)

    redirect_to("/venues_and_shows", { :notice => "We get it, you're 'too' 'cool' for that place."} )
  end

end
