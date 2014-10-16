class ElasticSliderWidget < Widget

  def self.valid_widget_classes_for(field_name)
    # unfortunately this does not work, the valid_widget_classes_for method is for Objs only:
    %w[ElastricSliderPanelWidget]
  end

end
