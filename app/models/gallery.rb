class Gallery < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  has_permalink :title

  validates :title, :presence => true, :uniqueness => true

  before_update :regenerate_permalink

private

  def regenerate_permalink
    self.generate_permalink!
  end

end
