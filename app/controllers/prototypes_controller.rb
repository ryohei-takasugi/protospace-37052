class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :prototype_find, only: [:show, :edit, :update, :destroy]
  before_action :is_identity, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all.includes(:user).with_attached_image
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to root_path
    else
      @prototype = prototype
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(prototype_id: params[:id])
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def prototype_find
    @prototype = Prototype.find(params[:id])
  end

  def is_identity
    redirect_to root_path unless current_user.id == @prototype.user_id
  end

end
