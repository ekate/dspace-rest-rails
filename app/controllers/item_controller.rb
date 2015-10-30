class ItemController < CollectionController

  # @return [@item, $base_rest_url, $endpoint, $json_node]
  def show

    @item = Item.find(params[:id])

    meta = String.new
    @metadata=Item.metadata((params[:id]))
    @metadata.each do |entry|
      meta += "<b>#{entry['key']}</b><br>"
      meta += "  #{entry['value']}<br>"
    end
    @item.metadata = meta
    respond_with(@item)

  end

end
