module BoxWidgetHelper

  def box_classes(box)
    classes = "box_icon "
    if box.show_frame?
      classes += "box_#{box.colour}"
    end
    classes
  end

end
