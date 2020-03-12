class VenuesController < ApplicationController
  def index
    @venues = Venue.all.order({ :created_at => :desc })

    render({ :template => "venues/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @venue = Venue.where({:id => the_id }).at(0)

    render({ :template => "venues/show.html.erb" })
  end

  def create
    @venue = Venue.new
    @venue.name = params.fetch("query_name")
    @venue.link = params.fetch("query_link")
    @venue.city = params.fetch("query_city")

    if @venue.valid?
      @venue.save
      redirect_to("/venues", { :notice => "Venue created successfully." })
    else
      redirect_to("/venues", { :notice => "Venue failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @venue = Venue.where({ :id => the_id }).at(0)

    @venue.name = params.fetch("query_name")
    @venue.link = params.fetch("query_link")
    @venue.city = params.fetch("query_city")

    if @venue.valid?
      @venue.save
      redirect_to("/venues/#{@venue.id}", { :notice => "Venue updated successfully."} )
    else
      redirect_to("/venues/#{@venue.id}", { :alert => "Venue failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @venue = Venue.where({ :id => the_id }).at(0)

    @venue.destroy

    redirect_to("/venues", { :notice => "Venue deleted successfully."} )
  end
end
