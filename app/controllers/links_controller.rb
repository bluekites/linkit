class LinksController < ApplicationController
  
  before_action :set_up_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @links = Link.all
  end
  
  def show
  end
  
  def new
    @link = current_user.links.build #builds it from user instead of just a link
  end
  
  def create
    @link = current_user.links.build(link_params)
    if @link.save
      flash[:success] = "Link created successfully!"
      redirect_to link_path(@link)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @link.update(link_params)
      flash[:success] = "Link updated successfully!"
      redirect_to link_path(@link)
    else
      render :edit
    end
  end
  
  def destroy
    @link.destroy
    redirect_to links_path
  end
  
  #upvote and downvote methods
  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back #will redirect them to the same page they were on
  end
  
  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end
  
  private
    
    def link_params
      params.require(:link).permit(:title, :url)
    end
    
    def set_up_link
      @link = Link.find(params[:id])
    end
end
