class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def create
    uploaded_io = params[:photo][:picture]
    photo_name = params[:photo][:name]
    if res = Cloudinary::Uploader.upload(uploaded_io, public_id: photo_name)
      photo = Photo.create name: res['public_id']
      redirect_to action: 'index'
    else
      raise "Couldn't!"
    end
  end
end
