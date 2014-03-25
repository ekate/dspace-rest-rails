class ItemController < CollectionController

  def show

    @item = Item.new
    url = url_append(params[:id], $baseRestURL + "/items")
    url = url_append("?expand=all", url)

    rawJSON = RestClient.get url ,{:accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    @item.id = $jsonNode['id'] unless $jsonNode['id'].nil?

    @item.name = $jsonNode['name'] unless $jsonNode['name'].nil?

    @item.handle = $jsonNode['handle'] unless $jsonNode['handle'].nil?

    @item.type = $jsonNode['type'] unless $jsonNode['type'].nil?

    @item.link = $jsonNode['link'] unless $jsonNode['link'].nil?

    @item.lastModified = $jsonNode['lastModified'] unless $jsonNode['lastModified'].nil?

    @item.parentCollection = $jsonNode['parentCollection'] unless $jsonNode['parentCollection'].nil?

    @item.parentCollectionList = $jsonNode['parentCollectionList'] unless $jsonNode['parentCollectionList'].nil?

    @item.parentCommunityList = $jsonNode['parentCommunityList'] unless $jsonNode['parentCommunityList'].nil?

    @item.metadata = $jsonNode['metadata'] unless $jsonNode['metadata'].nil?

    meta = String.new
    @item.metadata.each do |entry|
      meta += "<b>" + "#{entry['key']}" + "<br></b>"
      meta += "  "+ "#{entry['value']}" + "<br>"
    end
    @item.metadata = meta

    @item.bitstreams = $jsonNode['bitstreams'] unless $jsonNode['bitstreams'].nil?

    @item.archived = $jsonNode['archived'] unless $jsonNode['archived'].nil?

    @item.withdrawn = $jsonNode['withdrawn'] unless $jsonNode['withdrawn'].nil?

  end

end
