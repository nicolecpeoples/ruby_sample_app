class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
   add_template_helper(ApplicationHelper)
   add_template_helper(UsersHelper)
   add_template_helper(SessionsHelper)

   def base_url       
    $base_url = request.base_url
  end
end
