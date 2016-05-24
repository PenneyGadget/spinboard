class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      # stuff
    else
      #error,render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
