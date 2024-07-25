Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})

  get("/users", {:controller => "users", :action => "index"})
  get("/users/:user", {:controller => "users", :action => "details"})
  post("/update_user/:user_id", {:controller => "users", :action => "update"})
  post("/add_user", {:controller => "users", :action => "create"})

  get("/photos", {:controller =>"photo", :action => "index"})
  get("/photos/:path_id", {:controller =>"photo", :action => "details"})
  post("/update_photo/:path_id", {:controller =>"photo", :action => "update"})
  post("/add_photo", {:controller => "photo", :action => "create"})
  get("/delete_photo/:path_id", {:controller => "photo", :action => "destroy"})

  post("/comment", {:controller => "comment", :action => "add"})

  get("/follow_request", {:controller => "follow", :action => "requests"})

  get("/like", {:controller => "like", :action => "thumbs_up"})
end
