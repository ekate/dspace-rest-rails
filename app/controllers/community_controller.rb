class CommunityController < HomeController


  # @return [@community, $base_rest_url, $endpoint, $json_node]
  def show

    @community = Community.new
    $endpoint = url_append(params[:id], $base_rest_url + '/communities')
    $endpoint = url_append('?expand=all', $endpoint)

    raw_json = RestClient.get $endpoint, { :accept => :json}
    $json_node = JSON.parse(raw_json)

    $json_node.each do |key, value|
      unless key == 'expand'
        @community["#{key}"] = value
      end
    end

  end

end