class LinksController < ApplicationController
  
  before_action :set_up_link, only: [:show, :edit, :update, :destroy]
  
  def index
    @links = Link.all
  end
  
  def show
  end
  
  def new
    @link = Link.new
  end
  
  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_path(@link), notice: "Link created successfully!"
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @link.update(link_params)
      redirect_to link_path(@link), notice: "Link updated successfully!"
    else
      render :edit
    end
  end
  
  def destroy
    @link.destroy
    redirect_to links_path
  end
  
  private
    
    def link_params
      params.require(:link).permit(:title, :url)
    end
    
    def set_up_link
      @link = Link.find(params[:id])
    end
end
