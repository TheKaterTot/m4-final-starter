class LinksController < ApplicationController
  before_action :require_login
  
  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      render json: link
    else
      render json: {error: link.errors, status: 405 }
    end
  end

  def edit
    link
  end

  def update
    if link.update_attributes(link_params)
      flash[:success] = "Link updated!"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def link
    @link ||= Link.find(params[:id])
  end
end
