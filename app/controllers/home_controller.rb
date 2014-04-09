class HomeController < ApplicationController

      caches_action :index, layout: true
      caches_action :get_index_list, layout: false
      caches_action :list_col, layout: false

  # @return [@communities, @community_id, $base_rest_url, $endpoint, $json_node]
  def index

    @communities = Community.new

    $endpoint = url_append('communities', $base_rest_url)
    final_endpoint = $endpoint

    get_json
    $endpoint.gsub!('?expand=all','')
    @communities['subcommunities'] = $json_node

    @list = String.new
    get_index_list(@communities['subcommunities'])
    $endpoint = final_endpoint
    get_json

  end

  # Extremely slow... not sure if kb.osu.edu or code.
  def get_index_list(comlist)

    comlist.each do |com|

      @list += '<li class="tree">'
      @list += '<label for="'
      @list += com['name'][0,10] + '">'
      @list += self.class.helpers.link_to(com['name'], community_path(:id => com['id']))
      @list += '</label><input type="checkbox" id="' + com['name'][0,10] + '"/>'

      $endpoint = url_append(com['id'],"#{$base_rest_url}/communities")
      get_json

      #recursion
      if $json_node['collections'].size >= 1 or !$json_node['collections'].nil? or !$json_node['subcommunities'].nil? or $json_node['subcommunities'].size >= 1
        @list += '<ol>'
        unless $json_node['collections'].size < 1 or $json_node['collections'].size < 1
          list_col($json_node['collections'])
        end

        unless $json_node['subcommunities'].nil? or $json_node['subcommunities'].size < 1
          get_index_list($json_node['subcommunities'])
        end
        @list += '</ol>'
      end
    end
    @list += '</li>'
  end

  def list_col(collection_list)

    collection_list.each do |collection|
      @list += '<li class="file"><a href"'
      @list += self.class.helpers.link_to(collection['name'], collection_path(:id => collection['id']))
      @list += '</a></li>'

    end

  end
end