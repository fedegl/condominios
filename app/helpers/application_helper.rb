# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def admin?
		logged_in? && current_user.role == 'admin'
	end
	
	def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_delete) + link_to_function(name, "remove_fields(this)")
  end

end
