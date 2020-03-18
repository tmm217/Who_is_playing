class ShowFollowsController < ApplicationController
  def index
    @show_follows = ShowFollow.all.order({ :created_at => :desc })

    render({ :template => "show_follows/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @show_follow = ShowFollow.where({:id => the_id }).at(0)

    render({ :template => "show_follows/show.html.erb" })
  end

  def create
    @show_follow = ShowFollow.new
    @show_follow.show_id = params.fetch("query_show_id")
    @show_follow.attendee_id = @current_user.id

    if @show_follow.valid?
      @show_follow.save
      redirect_to("/venues_and_shows", { :notice => "That's a good one! Keep track of it." })
    else
      redirect_to("/venues_and_shows", { :notice => "Show follow failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @show_follow = ShowFollow.where({ :id => the_id }).at(0)

    @show_follow.show_id = params.fetch("query_show_id")
    @show_follow.attendee_id = params.fetch("query_attendee_id")

    if @show_follow.valid?
      @show_follow.save
      redirect_to("/show_follows/#{@show_follow.id}", { :notice => "Show follow updated successfully."} )
    else
      redirect_to("/show_follows/#{@show_follow.id}", { :alert => "Show follow failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @show_follow = ShowFollow.where({ :id => the_id }).at(0)

    @show_follow.destroy

    redirect_to("/venues_and_shows", { :notice => "Netflix is more fun, huh?"} )
  end
end
