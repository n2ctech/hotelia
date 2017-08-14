class Image < ApplicationRecord
  mount_uploader :file, ::ImageUploader

  belongs_to :attachable, polymorphic: true, optional: true

  def thumb_url
    file&.thumb&.url
  end

  def file_url
    file&.url
  end
end
