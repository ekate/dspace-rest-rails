class CommunityController < HomeController


  # @return [@community, $base_rest_url, $endpoint, $json_node]
  def show

    @community = Community.new
    $endpoint = url_append(params[:id], $base_rest_url + '/communities')

    get_json
    parse(@community)

  end

end