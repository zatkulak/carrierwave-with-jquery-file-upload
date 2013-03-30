class ImagesController < ApplicationController

  def index
    @images = Gallery.find(params[:gallery_id]).images
    respond_to do |format|
      format.json { render :json => @images.collect{ |p| p.to_jq_upload }.to_json }
    end
  end

  def create
    @image = Image.new(params[:image].merge({:gallery_id => params[:gallery_id]}))
    respond_to do |format|
      format.json {
        if @image.save
          render :json => [@image.to_jq_upload].to_json
        else
          render :json => [{:error => "not_working_error"}], :status => 304
        end
      }
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @image.destroy if @gallery.images.include? @image
    respond_to do |format|
      format.json { render :json => true }
    end
  end
end
