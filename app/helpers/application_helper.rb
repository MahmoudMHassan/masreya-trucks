module ApplicationHelper
  
  def find_errors(resource, field_name)
    if resource.errors[field_name].length > 0
      return "errorform".html_safe
    else
      return "".html_safe
    end
  end
end