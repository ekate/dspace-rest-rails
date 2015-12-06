class CommunityController < HomeController


  def show
    @community = Community.find(params[:id])
    respond_with(@community)
  end

  def new
    @community = Community.new
    respond_with(@community)
  end

  def edit
    @community = Community.find(params[:id])
    respond_with(@community)
  end

  def create
    @community = Community.create(params[:community])
    flash[:notice] = 'community was successfully created.' unless @community.nil
     redirect_to communities_url, notice: 'community was successfully created.'
  end

  def update
    flash[:notice] = 'community was successfully updated.' if Community.save(params[:community])
    redirect_to communities_url
  end

  def destroy

    Community.destroy(params[:community])
      redirect_to communities_url, notice: 'community was successfully deleted.'
  end

end