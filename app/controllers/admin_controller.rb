class AdminController < ApplicationController
  before_action :admin_only

  def add_genre
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit_user_role
    @users = User.all.where("id != #{current_user.id} ")
  end

  def update_user_role
    @users = User.all.where("id != #{current_user.id} ")
    if params['people']!=nil 
      @users.each do |user|
          if params['people'].include? user.id.to_s
            user.role = "admin"
          else
            user.role = "user" if user.role == "admin"
          end
          user.save
      end
    else
      @users.map {|user| user.update(role: "user")}
    end
    redirect_to edit_user_role_path
  end

  private
  	def admin_only
		  unless current_user.admin?
		    redirect_to root_path
		  end
  	end
end
