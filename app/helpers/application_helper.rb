module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when "notice"
      "success"   # Bootstrap's 'success' class
    when "alert"
      "danger"    # Bootstrap's 'danger' class
    else
      flash_type.to_s
    end
  end
end
