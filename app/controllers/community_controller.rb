class CommunityController < HomeController


  # @return [@community, $base_rest_url, $endpoint, $json_node]
  def show

    @community = Community.new
    $endpoint = url_append("/communities/#{params[:id]}")

    get_json
    parse(@community)

  end

end