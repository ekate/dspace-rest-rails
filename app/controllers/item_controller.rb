class ItemController < CollectionController

  def index
    if params[:offset]
      $endpoint = url_append('/items', "?offset=#{params[:offset]}")
    else
      $endpoint = url_append('/items')
    end

    get_json
    @items = $json_node['item']
  end

  # @return [@item, $base_rest_url, $endpoint, $json_node]
  def show

    @item = Item.new
    $endpoint = url_append("/items/#{params[:id]}")

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
