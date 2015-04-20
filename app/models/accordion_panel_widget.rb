class AccordionPanelWidget < Widget
  attribute :headline, :string
  attribute :content, :widgetlist

  def active_class
    "in" if self.container.panels.first == self
  end

  def description_for_editor
    "Accordion Panel"
  end

end

