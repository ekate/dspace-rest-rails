class HomeController < ApplicationController

  def index

    @communityID = Array.new
    @communities = Array.new

    url = url_append("communities", $baseRestURL)

    rawJSON = RestClient.get url, {:accept => :json}
    jsonNode = JSON.parse(rawJSON)

    i = 0
    while i < jsonNode.size

      @communityID.push jsonNode[i]['id']
      @communities.push jsonNode[i]['name']
      i += 1

    end

  end

end