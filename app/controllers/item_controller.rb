class ItemController < CollectionController

  # @return [@item, $base_rest_url, $endpoint, $json_node]
  def show

    @item = Item.new
    $endpoint = url_append(params[:id], $base_rest_url + '/items')

    get_json
    parse(@item)

    meta = String.new
    @item.metadata.each do |entry|
      meta += "<b>#{entry['key']}</b><br>"
      meta += "  #{entry['value']}<br>"
    end
    @item.metadata = meta

  end

end
