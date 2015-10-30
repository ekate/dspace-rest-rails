class CommunityController < HomeController



  # @return [@community, $base_rest_url, $endpoint, $json_node]
  def show

    @community = Community.find(params[:id])
    respond_with(@community)

  end

end