Rails.application.routes.draw do



  # Routes for the Show follow resource:

  # CREATE
  post("/insert_show_follow", { :controller => "show_follows", :action => "create" })
          
  # READ
  get("/show_follows", { :controller => "show_follows", :action => "index" })
  
  get("/show_follows/:path_id", { :controller => "show_follows", :action => "show" })
  
  # UPDATE
  
  post("/modify_show_follow/:path_id", { :controller => "show_follows", :action => "update" })
  
  # DELETE
  get("/delete_show_follow/:path_id", { :controller => "show_follows", :action => "destroy" })

  #------------------------------

  # Routes for the Venue follow resource:

  # CREATE
  post("/insert_venue_follow", { :controller => "venue_follows", :action => "create" })
          
  # READ
  get("/venue_follows", { :controller => "venue_follows", :action => "index" })
  
  get("/venue_follows/:path_id", { :controller => "venue_follows", :action => "show" })
  
  # UPDATE
  
  post("/modify_venue_follow/:path_id", { :controller => "venue_follows", :action => "update" })
  
  # DELETE
  get("/delete_venue_follow/:path_id", { :controller => "venue_follows", :action => "destroy" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  post("/insert_venue", { :controller => "venues", :action => "create" })
          
  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues_by_city/:city", { :controller => "venues", :action => "venue_by_city" })
  
  get("/venues/:path_id", { :controller => "venues", :action => "show" })
  
  # UPDATE
  
  post("/modify_venue/:path_id", { :controller => "venues", :action => "update" })
  
  # DELETE
  get("/delete_venue/:path_id", { :controller => "venues", :action => "destroy" })

  #------------------------------

  # Routes for the Show resource:

  # CREATE
  post("/insert_show", { :controller => "shows", :action => "create" })
          
  # READ
  get("/shows", { :controller => "shows", :action => "index" })
  
  get("/shows/:path_id", { :controller => "shows", :action => "show" })
  
  # UPDATE
  
  post("/modify_show/:path_id", { :controller => "shows", :action => "update" })
  
  # DELETE
  get("/delete_show/:path_id", { :controller => "shows", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
