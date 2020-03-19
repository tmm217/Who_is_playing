class UserSessionsController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_session_form, :create_cookie] })

  def new_session_form
    render({ :template => "user_sessions/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).at(0)
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Who the hell are you!? That's not the right password." })
      else
        session.store(:user_id, user.id)
      
        redirect_to("/venues_and_shows", { :notice => "You're in!" })
      end
    else
      redirect_to("/user_sign_in", { :alert => "Hm...that username doesn't exist, amigo." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/user_sign_in", { :notice => "G'bye!" })
  end
 
end
