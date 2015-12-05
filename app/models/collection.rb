class Collection < DspaceObject
  base_url Rails.application.config.api_server_url

  has_attr :name

  get :all, "/collections/"
  get :find, "/collections/:id"
  get :items, "/collections/:id/items"
  post :login , "/login/",  plain: true
  put :save, "/collections/:id"
  post :create, "/collections"
end
