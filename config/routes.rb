Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  resources "entries"
  resources "places"
  resources "sessions"
  get("/login", {:controller => "sessions", :action => "new"})


  resources "users"
end
