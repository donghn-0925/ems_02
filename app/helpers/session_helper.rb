module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def home_path(role)
    if role == User.roles[:supervisor]
      supervisor_index_path
    elsif role == User.roles[:admin]
      admin_index_path
    else trainee_index_path
    end
  end
end
