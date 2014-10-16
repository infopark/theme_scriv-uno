class ElasticSliderPanelWidget < Widget

  def additional_classes(params)
    if params[:_scrivito_display_mode] != "editing"
      begin
        "active" if self.container.panels.first == self
      rescue
      end
    else
      "editing-view"
    end
  end
  
end
