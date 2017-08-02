class Image < ApplicationRecord
  mount_uploader :file, ::ImageUploader

  belongs_to :attachable, polymorphic: true

  def thumb_url
    file&.thumb&.url
  end
end
