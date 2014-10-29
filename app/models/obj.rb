class Obj < ::Scrivito::BasicObj

  def breadcrumbs
    objects = self.ancestors.split(self.homepage.parent).second.presence || []
    objects + [self]
    #objects.select { |object| object.show_in_navigation? }
  end

  def homepage
    self.is_a?(Homepage) ? self : self.ancestors.select{|o| o.is_a?(Homepage)}.first
  end

  def show_in_navigation?
    # single ObjClasses may overwrite this method
    self.respond_to?('show_in_navigation') && self.show_in_navigation == "no" ? false : true
  end

  def valid_widget_classes_for(field_name)
    if field_name == "full_slider"
      %w(ElasticSliderWidget)
    end
  end


end

