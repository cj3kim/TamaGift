module ApplicationHelper
  def generate_sign_in_or_out_link
    if user_signed_in?
      link_to "sign out", "/users/sign_out", method: :delete
    else
      link_to "sign in", "/users/sign_in", method: :get
    end 
  end
end
