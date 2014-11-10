module ApplicationHelper

  def active_class(item, obj)
    if item == obj
      "active"
    end
  end

  def part_of_path?(item, obj)
    if obj.path =~ /^#{item.path}/
      true
    else
      false
    end
  end

end
