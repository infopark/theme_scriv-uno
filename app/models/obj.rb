class Obj < Scrivito::BasicObj

  def breadcrumbs
    (self.ancestors + [self]).select {|object| object.show_in_navigation?}
  end

  def has_other_content?
    self.respond_to?('other_content') && !self.other_content.blank? ? true : false
  end

  def has_subnav_content?
    if not self.toclist.select{|t| t.show_in_navigation?}.blank?
      true
    else
      false
    end
  end

  def homepage
    self.is_a?(Homepage) ? self : self.ancestors.select{|o| o.is_a?(Homepage)}.first
  end

  def icon
    self[:icon].presence || "globe"
  end

  def self.selectable_color_classes(obj_name, field_name)
    return ["blue", "green", "grey", "white"]
  end

  def show_in_navigation?
    # single ObjClasses often overwrite this method
    self.respond_to?('show_in_navigation') && self.show_in_navigation == "no" ? false : true
  end

  def summary
    # delivers first text from content widgets for display in search results and listings:
    self.body.map(&:summary).flatten.join.first(200) rescue ""
  end

  def thumbnail_icon
    "foundicon-page"
  end 
  
  def valid_widget_classes_for(field_name)
    #TBD: when Widgets can also be blacklisted, we can remove all this whitelisting here:
    my_standard_widgets = %w(AccordionWidget BoxWidget ElasticSliderWidget GoogleMapsWidget HeadlineWidget IconBoxWidget ImageWidget ListitemWidget NavigationWidget PersonWidget SlickSliderWidget TabbedContentWidget TextWidget ThreeColumnWidget TwoColumnWidget)
    case field_name
      when "body"
        my_standard_widgets
      when "column_1"
        my_standard_widgets
      when "column_2"
        my_standard_widgets
      when "column_3"
        my_standard_widgets
      when "full_slider"
        %w(ElasticSliderWidget)
      when "other_content"
        %w(BackgroundWidget)
      when "teaser"
        %w(HeadlineWidget IconBoxWidget ImageWidget ListitemWidget PersonWidget SlickSliderWidget TabbedContentWidget TextWidget ThreeColumnWidget TwoColumnWidget)
    end
  end

end

