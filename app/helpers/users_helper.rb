module UsersHelper

  def admin?
    if current_user && current_user.admn?
        return true
    else
      return false
    end
  end

end
