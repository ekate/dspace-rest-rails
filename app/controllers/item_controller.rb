class ItemController < CollectionController

  # @return [@item, $base_rest_url, $endpoint, $json_node]
  def show

    @item = Item.new
    $endpoint = url_append(params[:id], $base_rest_url + '/items')
    $endpoint = url_append('?expand=all', $endpoint)

    raw_json = RestClient.get $endpoint ,{:accept => :json}
    $json_node = JSON.parse(raw_json)

    $json_node.each do |key, value|
      unless key == 'expand'
        @item["#{key}"] = value
      end
    end

    meta = String.new
    @item.metadata.each do |entry|
      meta += "<b>#{entry['key']}</b><br>"
      meta += "  #{entry['value']}<br>"
    end
    @item.metadata = meta

  end

end
