class Item < DspaceObject

get :all, "/items/"
get :top, "/communities/top-communities"
get :find, "/items/:id"
get :metadata, "/items/:id/metadata"
get :bitstreams, "/items/:id/bitstreams"
get :subcommunities, "/communities/:id/communities"
post :logins , "/logins/",  plain: true
put :save, "/communities/:id"
post :create, "/communities"
end