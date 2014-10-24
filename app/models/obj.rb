class Obj < ::Scrivito::BasicObj

  def breadcrumbs
    objects = self.ancestors.split(self.homepage.parent).second.presence || []
    objects + [self]
    #objects.select { |object| object.show_in_navigation? }
  end

  def headline
    self[:headline].presence || self.title || ""
  end

  def homepage
    if self.is_a?(Homepage)
      self
    else
      self.ancestors.select{|o| o.is_a?(Homepage)}.first
    end
  end

  def valid_widget_classes_for(field_name)
    if field_name == "full_slider"
      %w(ElasticSliderWidget ElasticSliderPanelWidget)
    end
  end


end
