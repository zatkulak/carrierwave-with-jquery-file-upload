class Image < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :gallery

  before_destroy :remember_id
  after_destroy :remove_id_directory

  mount_uploader :file, ImageUploader

  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.small.url,
      "delete_url" => gallery_image_path(gallery_id, id),
      "delete_type" => "DELETE"
    }
  end

private

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/#{ImageUploader.new.store_dir_base(self.class, @id)}", :force => true)
  end

end
