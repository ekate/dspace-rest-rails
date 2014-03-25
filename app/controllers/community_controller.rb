class CommunityController < HomeController


  # @return [@community, $baseRestUrl, $endpoint, $jsonNode]
  def show

    @community = Community.new
    $endpoint = url_append(params[:id], $baseRestURL + '/communities')
    $endpoint = url_append("?expand=all", $endpoint)

    rawJSON = RestClient.get $endpoint, { :accept => :json}
    $jsonNode = JSON.parse(rawJSON)

    $jsonNode.each do |key, value|
      unless key == "expand"
        @community["#{key}"] = value
      end
    end

  end

end