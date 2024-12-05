class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_picture, ProfilePictureUploader

  # Validaciones
  validates :name, presence: true
  validates :profile_picture, presence: true
  has_many :photos
  
  # Métodos para controlar roles
  def admin?
    role == 'admin'
  end

  def karina?
    role == 'karina' # Asume que el rol de Karina es 'karina'
  end

  def regular_user?
    role == 'user'
  end

end
