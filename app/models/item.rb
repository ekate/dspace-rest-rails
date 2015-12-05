class Item < DspaceObject

get :all, "/items/"
get :top, "/communities/top-communities"
get :find, "/items/:id"
get :metadata, "/items/:id/metadata"
get :bitstreams, "/items/:id/bitstreams"
get :subcommunities, "/communities/:id/communities"
post :login , "/login/",  plain: true
put :save, "/communities/:id"
post :create, "/communities"
end