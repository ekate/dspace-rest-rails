# app/models/person.rb
class Community <DspaceObject
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  attr_reader :name, :shortDescription

  def model_name
    @_model_name =self.name
  end

  get :all, "/communities/"
  get :top, "/communities/top-communities"
  get :find, "/communities/:id"
  get :collections, "/communities/:id/collections"
  get :subcommunities, "/communities/:id/communities"
  put :save, "/communities/:id"
  delete :destroy, "/communities/:id"
  post :create, "/communities"
  post :login , "/login/",  plain: true

end
