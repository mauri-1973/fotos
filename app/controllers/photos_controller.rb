class PhotosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource # Asegúrate de que los permisos son verificados

  def new
    # Aquí se crea una nueva instancia de Photo
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo, notice: 'Fotografía subida con éxito.'
    else
      render :new
    end
  end

  def index
    @photos = Photo.all
  end

  def show
    @comments = @photo.comments.includes(:user)
    @comment = @photo.comments.build
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image) # Asegúrate de tener :image
  end
end