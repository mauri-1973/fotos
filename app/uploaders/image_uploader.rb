class ImageUploader < CarrierWave::Uploader::Base
    storage :fog # Si estás usando S3 o puedes usar :file para almacenamiento local.
  
    # Puedes configurar el tamaño, tipos de archivo permitidos, etc.
    def extension_allowlist
      %w(jpg jpeg gif png)
    end
  
    # Es posible que desees definir un método para limitar el tamaño
    def size_range
      1..2.megabytes # Esto permite archivos de entre 1 byte y 2 megabytes.
    end
  end