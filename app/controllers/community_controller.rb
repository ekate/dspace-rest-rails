class CommunityController < HomeController


def index

  @community = Community.new
  url = url_append(params[:id], $baseRestURL + '/communities')

  rawJSON = RestClient.get url, { :accept => :json}
  jsonNode = JSON.parse(rawJSON)

  if jsonNode['id']
    @community.id = jsonNode['id']
  end

  if jsonNode['name']
    @community.name = jsonNode['name']
  end

  if jsonNode['handle']
    @community.handle = jsonNode['handle']
  end

  if jsonNode['type']
    @community.type = jsonNode['type']
  end

  if jsonNode['link']
    @community.link = jsonNode['link']
  end

  @community.collections = "something not nil"


end

  def show
    render :text =>  "Hello" + params["id"]
  end

end
