class TabbedContentWidget < Widget
  attribute :tabs, :widgetlist


  DEFAULT_TABS = 2

  def self.valid_widget_classes_for(field_name)
    %w[TabbedContentTabWidget]
  end

  def description_for_editor
    "Tabbed Content"
  end

  def tabs_with_default
    _tabs = tabs.clone
    missing_tabs.times do
      _tabs << PlaceholderTabWidgetElement.new
    end
    _tabs
  end

  private

  def missing_tabs
    DEFAULT_TABS - tabs.size
  end

  class PlaceholderTabWidgetElement

    def id
      @id ||= SecureRandom.hex(2)
    end

    def headline
      'Widget Placeholder'
    end

    def content
      []
    end

  end

end