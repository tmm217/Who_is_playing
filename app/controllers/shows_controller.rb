class ShowsController < ApplicationController
  def index
    @shows = Show.all.order({ :created_at => :desc })

    render({ :template => "shows/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @show = Show.where({:id => the_id }).at(0)

    render({ :template => "shows/show.html.erb" })
  end

  def create
    @show = Show.new
    @show.bands = params.fetch("query_bands")
    @show.is_soldout = params.fetch("query_is_soldout", false)
    @show.image = params.fetch("query_image")
    @show.host_id = params.fetch("query_host_id")
    @show.show_date = params.fetch("query_show_date")

    if @show.valid?
      @show.save
      redirect_to("/shows", { :notice => "Show created successfully." })
    else
      redirect_to("/shows", { :notice => "Show failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @show = Show.where({ :id => the_id }).at(0)

    @show.bands = params.fetch("query_bands")
    @show.is_soldout = params.fetch("query_is_soldout", false)
    @show.image = params.fetch("query_image")
    @show.host_id = params.fetch("query_host_id")
    @show.show_date = params.fetch("query_show_date")

    if @show.valid?
      @show.save
      redirect_to("/shows/#{@show.id}", { :notice => "Show updated successfully."} )
    else
      redirect_to("/shows/#{@show.id}", { :alert => "Show failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @show = Show.where({ :id => the_id }).at(0)

    @show.destroy

    redirect_to("/shows", { :notice => "Show deleted successfully."} )
  end
end
