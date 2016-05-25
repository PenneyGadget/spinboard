class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:notice] = "New link saved!"
      redirect_to links_path
    else
      flash.now[:error] = "Invalid url, please try again."
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
