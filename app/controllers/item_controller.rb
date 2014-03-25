class ItemController < CollectionController

  # @return [@item, $baseRestUrl, $endpoint, $jsonNode]
  def show

    @item = Item.new
    $endpoint = url_append(params[:id], $baseRestURL + "/items")
    $endpoint = url_append("?expand=all", $endpoint)

    rawJSON = RestClient.get $endpoint ,{:accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    $jsonNode.each do |key, value|
      unless key == "expand"
        @item["#{key}"] = value
      end
    end

    meta = String.new
    @item.metadata.each do |entry|
      meta += "<b>" + "#{entry['key']}" + "<br></b>"
      meta += "  "+ "#{entry['value']}" + "<br>"
    end
    @item.metadata = meta

  end

end
