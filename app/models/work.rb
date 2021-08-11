class Work < ApplicationRecord
    attr_accessor :image_cache
    mount_uploader :image , ImageUploader

    with_options presence: true do
        validates :image
        validates :name
        validates :occupation
        validates :wage
        validates :hours
        validates :location
        validates :period
        validates :link
        validates :note
        validates :email
        validates :tel
      end
      
end