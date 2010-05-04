# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def get_user(user)
    user = User.find(session[:user])
  end
  
  def admin?
    user = get_user(session[:user])
    if user
      user.usertype == "Administrator"
    end
  end
end
