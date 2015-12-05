
class DspaceObject< ActiveRestClient::Base
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  attr_accessor :base_url

  def self.base_url
    Rails.application.config.api_server_url
  end

  post :login , "/login/",  plain: true

  authorization_required=["save","create","destroy"]

  before_request do |name, request|

    if(name.to_s=="login")
      request.post_params = { "email" =>"dspace@test", "password"=>"dspace"}
    end
    if(authorization_required.include?(name.to_s))
      request.headers["rest-dspace-token"]=self.login
      request.body = request.post_params.to_json
    end
    request.headers["Content-Type"] = "application/json"
    request.body = request.post_params.to_json
    end
  end
