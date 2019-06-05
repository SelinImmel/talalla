class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # removed everything else following the lecture slide-instructions
end
