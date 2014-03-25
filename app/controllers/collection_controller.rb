class CollectionController < CommunityController

  # @return [@collection, $baseRestUrl, $endpoint, $jsonNode]
  def show

    @collection = Collection.new
    $endpoint = url_append(params[:id], $baseRestURL + "/collections")
    $endpoint = url_append("?expand=all", $endpoint)

    rawJSON = RestClient.get $endpoint ,{:accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    $jsonNode.each do |key, value|
      unless key == "expand"
        @collection["#{key}"] = value
      end
    end

  end

end
