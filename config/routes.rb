Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})

  get("/users", {:controller => "users", :action => "index"})
  get("/users/:user", {:controller => "users", :action => "details"})
  post("/modify_user/:user", {:controller => "users", :action => "update"})
  post("/add_user", {:controller => "users", :action => "create"})

  get("/photos", {:controller =>"photo", :action => "index"})
  get("/photos/:path_id", {:controller =>"photo", :action => "details"})
  post("/modify_photo/:path_id", {:controller =>"photo", :action => "update"})
  post("/add_photo", {:controller => "photo", :action => "create"})

  get("/comment", {:controller => "comment", :action => "photo_comment"})

  get("/follow_request", {:controller => "follow", :action => "requests"})

  get("/like", {:controller => "like", :action => "thumbs_up"})
end
