# README

rails new xxxxxxxxxxx -d postgresql

rails db:create

agregar bootstrap como gema al proyecto
		gem install bootstrap
		gem install jquery-rails
		gem install popper_js
		gem install sassc-rails
		gem install faker
		gem install figaro

2  agregamos la gema al Gemfile y ejecuta un bundle install
		bundle add bootstrap
		bundle add jquery-rails
		bundle add popper_js
		bundle add sassc-rails
		bundle add faker
		bundle exec figaro install

3 cambiar el nombre 
		application.css a application.scss
	
4 agregar en application.scss la linea
		@import "bootstrap";
	
5 agregar a application.js 
		import "bootstrap"
        //import "popper"

6 agregar en initializers/config/assets.rb
		Rails.application.config.assets.precompile += %w( application.scss bootstrap.min.js popper.js )
	
7 agregar en config/importmap.rb
		pin "popper", to: 'popper.js', preload: true
		pin "bootstrap", to: 'bootstrap.min.js', preload: true
		
8 descomentar en Gemfile y ejecutar bundle install
        gem "sassc-rails"

9 gem install devise
		bundle add devise
		rails generate devise:install
		rails g devise:views
		rails generate devise user
    rails generate devise:controllers users


    rails active_storage:install

rails g migration AddDetailsToUsers photo name

rails db:migrate

rails generate migration AddRoleToUsers role:integer //Agregando roles

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy  # Añade esta línea
  has_many :liked_posts, through: :likes, source: :post  # También debe estar presente

  enum role: { user: 0, moderator: 1, admin: 2 }

  before_create :set_default_role

  def set_default_role
    self.role ||= :user
  end
  
end


//Agregando CanCanCan

gem 'cancancan'
bundle install
rails g cancan:ability

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    case user.role
    when 'admin'
      can :manage, :all  # Los administradores pueden hacer todo
    when 'moderator'
      can :read, :all          # Los moderadores pueden leer todo
      can :update, Post
      can :create, Comment
    when 'user'
      can :read, :all          # Los moderadores pueden leer todo
      can :like, Post
      can :create, Comment      # Los moderadores pueden actualizar Post
    else
      can :read, Post          # Los usuarios regulares pueden leer Post
    end
  end
end

//agregar en los controladores los permisos asignados

 load_and_authorize_resource

// Manejo de errores al autenticar

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
end

// Utilización en las vistas para definir las funcionalidades que tendra cada rol

<% if can? :create, Post %>
  <%= link_to 'New Post', new_post_path %>
<% end %>
<image src="/imagenes/1.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/3.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/2.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/4.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/5.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/6.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/7.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/8.jpeg" alt="Descripción de la imagen">
<image src="/imagenes/9.jpeg" alt="Descripción de la imagen">
 
URL's imagenes AWS
https://mascotatinder.s3.us-east-2.amazonaws.com/uploads/cd4a753a-a140-450a-b8cc-e90a3dd1a6f9.jpeg?X-Amz-Expires=600&amp;X-Amz-Date=20241205T034639Z&amp;X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA5FCD6MCHYN4VAALK%2F20241205%2Fus-east-2%2Fs3%2Faws4_request&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=19eb261abf11fdad35087b6e01439068a2026f242fcda810650b91c5a312a646

<br>
https://mascotatinder.s3.us-east-2.amazonaws.com/uploads/0b2dae8928e178f368b6d152a1367b7f--cats-meowing-kitty-cats.jpg?X-Amz-Expires=600&amp;X-Amz-Date=20241205T034639Z&amp;X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA5FCD6MCHYN4VAALK%2F20241205%2Fus-east-2%2Fs3%2Faws4_request&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=119cd27d6d60cdcf5a78deb5a365a369641ee246edf3fc308d249e1dc08a946b
<br>
<image src="https://mascotatinder.s3.us-east-2.amazonaws.com/uploads/0b2dae8928e178f368b6d152a1367b7f--cats-meowing-kitty-cats.jpg?X-Amz-Expires=600&amp;X-Amz-Date=20241205T034639Z&amp;X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA5FCD6MCHYN4VAALK%2F20241205%2Fus-east-2%2Fs3%2Faws4_request&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=119cd27d6d60cdcf5a78deb5a365a369641ee246edf3fc308d249e1dc08a946b">
<br>
<image class="card-img-top" src="https://mascotatinder.s3.us-east-2.amazonaws.com/uploads/cd4a753a-a140-450a-b8cc-e90a3dd1a6f9.jpeg?X-Amz-Expires=600&amp;X-Amz-Date=20241205T034639Z&amp;X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA5FCD6MCHYN4VAALK%2F20241205%2Fus-east-2%2Fs3%2Faws4_request&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=19eb261abf11fdad35087b6e01439068a2026f242fcda810650b91c5a312a646">
