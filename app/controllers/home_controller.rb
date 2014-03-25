class HomeController < ApplicationController

  caches_page :index, expires_in: 1.hour

  # @return [@communities, @community_id, $base_rest_url, $endpoint, $json_node]
  def index

    $base_rest_url = 'http://kb.osu.edu/rest'

    @community_id = Array.new
    @communities = Array.new

    $endpoint = url_append('communities', $base_rest_url)

    raw_json = RestClient.get $endpoint, {:accept => :json}
    $json_node = JSON.parse(raw_json)

    i = 0
    while i < $json_node.size

      @community_id.push $json_node[i]['id']
      @communities.push $json_node[i]['name']
      i += 1

    end

  end

end