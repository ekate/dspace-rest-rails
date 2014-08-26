class CollectionController < CommunityController

  # @return [@collection, $base_rest_url, $endpoint, $json_node]
  def show

    @collection = Collection.new
    if params[:offset]
      $endpoint = url_append("/collections/#{params[:id]}", "?expand=all&offset=#{params[:offset]}")
    else
      $endpoint = url_append("/collections/#{params[:id]}")
    end


    get_json
    parse(@collection)

  end

end
