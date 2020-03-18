class UsersController < ApplicationController
  # skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def venues_and_shows
    render({ :template => "users/venues_and_shows.html.erb" })
  end

  def experiment
    render({:template => "users/copy_venues_and_shows.html.erb"})
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.username = params.fetch("query_username")

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
   
      redirect_to("/cities", { :notice => "May I take your hat, sir?!."})
    else
      redirect_to("/user_sign_up", { :alert => "Oh, boy. You've got problems."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.username = params.fetch("query_username")
    
    if @user.valid?
      @user.save

      redirect_to("/edit_user_profile", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/user_sign_up", { :notice => "User account cancelled" })
  end
  
end
