class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader # Asegúrate de que esto es correcto

  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true # Si quieres que la imagen sea obligatoria
end
