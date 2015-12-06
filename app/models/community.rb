# app/models/person.rb
class Community <DspaceObject
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  attr_reader :community_name, :shortDescription

  def model_name
    @_model_name ="Community"
  end

  get :all, "/communities/"
  get :top, "/communities/top-communities"
  get :find, "/communities/:id"
  get :collections, "/communities/:id/collections"
  get :subcommunities, "/communities/:id/communities"
  put :save, "/communities/:id"
  delete :destroy, "/communities/:id"
  post :create, "/communities"
  post :logins , "/logins/",  plain: true

end
