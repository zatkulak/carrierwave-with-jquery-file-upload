class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.all
  end

  def new
    gallery = Gallery.new
    render :partial => "form", :locals => {:gallery => gallery}, :status => :ok
  end

  def create
    gallery = Gallery.create(params[:gallery])
    if gallery.valid?
      galleries = Gallery.all
      render :partial => "list", :locals => {:galleries => galleries}, :status => :ok
    else
      render :partial => "form", :locals => {:gallery => gallery}, :status => :unprocessable_entity
    end
  end

  def edit
    gallery = Gallery.find_by_permalink(params[:id])
    render :partial => "form", :locals => {:gallery => gallery}, :status => :ok
  end

  def update
    gallery = Gallery.find_by_permalink(params[:id])
    if gallery.update_attributes(params[:gallery])
      galleries = Gallery.all
      render :partial => "list", :locals => {:galleries => galleries}, :status => :ok
    else
      render :partial => "form", :locals => {:gallery => gallery}, :status => :unprocessable_entity
    end
  end

  def destroy
    gallery = Gallery.find_by_permalink(params[:id])
    gallery.destroy
    redirect_to root_path
  end

  def manage
    @gallery = Gallery.find_by_permalink(params[:id])
    respond_to do |format|
      format.html { render :layout => 'multiupload_layout' }
    end
  end

end
