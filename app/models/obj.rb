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

  def show_in_navigation?
    # single ObjClasses often overwrite this method
    self.respond_to?('show_in_navigation') && self.show_in_navigation == "No" ? false : true
  end

  def summary
    # delivers first text from content widgets for display in search results and listings:
    self.body.map(&:summary).flatten.join.first(200) rescue ""
  end

  def thumbnail_icon
    "foundicon-page"
  end

  def self.selectable_color_classes(obj_name, field_name)
    ["", "bg_blue", "bg_green", "bg_grey1", "bg_grey2", "bg_grey3", "bg_white"]
  end

  def self.valid_page_classes_beneath(parent_path)
    obj = Obj.find_by_path(parent_path)

    if obj.is_a?(Blog)
      [BlogPost]
    else
      [Page, Blog]
    end
  end

  def valid_widget_classes_for(field_name)
    if ['other_content'].include? field_name
      Obj.section_widgets
    else
      Scrivito.models.widgets.map {|e| e} - Obj.section_widgets - Obj.hidden_widgets
    end
  end

  private
  def self.section_widgets
    [BackgroundWidget, GoogleMapsWidget, ElasticSliderWidget]
  end

  def self.hidden_widgets
    [ElasticSliderPanelWidget, Scrivito::ContentWidget]
  end

end
