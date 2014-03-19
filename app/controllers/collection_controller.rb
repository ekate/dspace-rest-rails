class CollectionController < ApplicationController

  def show

    @collection = Collection.new
    url = url_append(params[:id], $baseRestURL + "/collections")
    url = url_append("?expand=all", url)

    rawJSON = RestClient.get url ,{:accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    @collection.id = $jsonNode['id'] unless $jsonNode['id'].nil?

    @collection.name = $jsonNode['name'] unless $jsonNode['name'].nil?

    @collection.handle = $jsonNode['handle'] unless $jsonNode['handle'].nil?

    @collection.type = $jsonNode['type'] unless $jsonNode['type'].nil?

    @collection.logo = $jsonNode['logo'] unless $jsonNode['logo'].nil?

    @collection.parentCommunity = $jsonNode['parentCommunity'] unless $jsonNode['parentCommunity'].nil?

    @collection.parentCommunityList = $jsonNode['parentCommunityList'] unless $jsonNode['parentCommunityList'].nil?

    @collection.items = $jsonNode['items'] unless $jsonNode['items'].nil?

    @collection.license = $jsonNode['license'] unless $jsonNode['license'].nil?

    @collection.numberItems = $jsonNode['numberItems'] unless $jsonNode['numberItems'].nil?

    #$jsonNode.each do |key|
    #  @collection.key = $jsonNode["#{key}"]
    #end

  end

end
