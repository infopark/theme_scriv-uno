class SlickSliderWidget < Widget
  attribute :panels, :widgetlist


  def description_for_editor
    "Slick Slider"
  end

  def self.valid_widget_classes_for(field_name)
    %w[SlickSliderPanelWidget]
  end

end