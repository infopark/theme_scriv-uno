class TabbedContentTabWidget < Widget
  attribute :content, :widgetlist
  attribute :headline, :string


  def additional_classes
    self.container.respond_to?("tabs") && self.container.tabs.first == self ? "active" : ""
  end

  def description_for_editor
   "Tab"
  end

end