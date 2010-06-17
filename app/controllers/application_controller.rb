# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
    def check_user()
    sess_id = get_joomla_session_id
    if sess_id == nil
      redirect_to :controller => :joomla, :action => :kick
    else
      sess = Jsession.find_by_session_id(sess_id)
      if sess.nil?
        session[:sess_id] = sess_id
        redirect_to :controller => :joomla, :action => :debug
      else
        if sess.username == ""
          redirect_to :controller => :joomla, :action => :kick
        else
          current_user = User.find_by_username(sess.username)
          session[:user] = current_user.id
          session[:username] = current_user.username
        end
      end
    end
  end
  
  def get_user(userid)
    User.find_by_id(userid)
  end
  
  
  def admin?
    user = get_user(session[:user])
    if user #to prevent nil.usertype errors
      user.usertype == "Administrator"
    else
      redirect_to :controller => :joomla, :action => :kick
    end
  end


  def get_joomla_session_id
    cookies[JSESSION_NAME]
  end
  
  def get_closest_time(t = Time.now)
    hr = ""
    min = ""
    if (t.min <= 50)
        hr =  t.hour
        min = ":30"
        if hr >= 12
          hr -= 12
          min += " PM"
        else
          min += " AM"
        end
    else
        hr = (t.hour + 1)
        min = ":30"
        if hr >= 12
          hr -= 12
          min += " PM"
        else
          min += " AM"
        end
    end
    tval = hr.to_s + min.to_s
    tval
  end
       
end