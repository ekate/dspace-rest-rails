class CommunityController < HomeController


  # @return [@community]
  def show

    @community = Community.new
    url = url_append(params[:id], $baseRestURL + '/communities')
    url = url_append("?expand=all", url)

    rawJSON = RestClient.get url, { :accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    @community.id = $jsonNode['id'] unless $jsonNode['id'].nil?

    @community.name = $jsonNode['name'] unless $jsonNode['name'].nil?

    @community.handle = $jsonNode['handle'] unless $jsonNode['handle'].nil?

    @community.type = $jsonNode['type'] unless $jsonNode['type'].nil?

    @community.link = $jsonNode['link'] unless $jsonNode['link'].nil?

    @community.logo= $jsonNode['logo'] unless $jsonNode['logo'].nil?

    @community.logo= $jsonNode['parentCommunity'] unless $jsonNode['parentCommunity'].nil?

    @community.copyrightText = $jsonNode['copyrightText'] unless $jsonNode['copyrightText'].nil?

    @community.introductoryText = $jsonNode['introductoryText'] unless $jsonNode['introductoryText'].nil?

    @community.shortDescription = $jsonNode['shortDescription'] unless $jsonNode['shortDescription'].nil?

    @community.sidebarText = $jsonNode['sidebarText'] unless $jsonNode['sidebarText'].nil?

    @community.countItems = $jsonNode['countItems'] unless $jsonNode['countItems'].nil?

    @community.collections = $jsonNode['collections'] unless $jsonNode['collections'].nil?

    @community.subcommunities = $jsonNode['subcommunities'] unless $jsonNode['subcommunities'].nil?

  end

end
