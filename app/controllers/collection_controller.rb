class CollectionController < CommunityController

  # @return [@collection, $base_rest_url, $endpoint, $json_node]
  def show

    @collection = Collection.find(params[:id])

    respond_with(@collection)

  end

end
