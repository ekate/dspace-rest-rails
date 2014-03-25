class CollectionController < CommunityController

  # @return [@collection, $base_rest_url, $endpoint, $json_node]
  def show

    @collection = Collection.new
    $endpoint = url_append(params[:id], "#{$base_rest_url}/collections")
    $endpoint = url_append('?expand=all', $endpoint)

    raw_json = RestClient.get $endpoint ,{:accept => :json}
    $json_node = JSON.parse(raw_json)

    $json_node.each do |key, value|
      unless key == 'expand'
        @collection["#{key}"] = value
      end
    end

  end

end
