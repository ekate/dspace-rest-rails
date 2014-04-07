class CollectionController < CommunityController

  # @return [@collection, $base_rest_url, $endpoint, $json_node]
  def show

    @collection = Collection.new
    $endpoint = url_append(params[:id], "#{$base_rest_url}/collections")

    get_json
    parse(@collection)

  end

end
