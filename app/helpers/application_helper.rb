#encoding: utf-8
module ApplicationHelper

  def error_messages_for(object)
    output = ""
    if object.errors.any?
      output += '<div class="alert alert-error"><a class="close" data-dismiss="alert">×</a><ul style="margin-bottom: 0px;">'
      object.errors.full_messages.each do |msg|
        output += '<li>'
        output += msg
        output += '</li>'
      end
      output += '</ul></div>'
    end
    raw(output) unless output.blank?
  end

  def form_title(object, model_name)
    object.new_record? ? toReturn = "New" : toReturn = "Editing"
    toReturn + " " + model_name.downcase
  end

  def form_button_text(object)
    object.new_record? ? "Create" : "Update"
  end

end
