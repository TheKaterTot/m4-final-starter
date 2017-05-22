class LinksController < ApplicationController
  before_action :require_login
  def index
    @link = Link.new
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      render json: link
    else
      head 405
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
