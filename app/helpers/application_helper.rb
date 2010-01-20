# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def admin?
		logged_in? && current_user.role == 'admin'
	end

end
