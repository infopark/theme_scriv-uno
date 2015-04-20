class IconBoxWidget < Widget
  attribute :icon, :string
  attribute :color, :string
  attribute :background_color, :string
  attribute :size, :enum, values: ["small","medium","large"]
  attribute :style, :enum, values: ["circle","square","filled-circle","filled-square"]

  def selectable_color_classes(class_name, attribute)
    if Obj.respond_to?('selectable_color_classes')
      Obj.selectable_color_classes(class_name, attribute)
    else
      IconBoxWidget.fallback_colors
    end
  end

  def self.icons
    ["none", "plus","minus","warning","paw","send","car","sliders","tree","bell","certificate","cloud","comment","dashboard","female","male","flag","globe","heart","leaf","plane","refresh","rocket","question","star","unlock"]
  end

  def background_class
    self.background_color
  end

  private 
  def self.fallback_colors
    %w(transparent black gray light-gray red green blue yellow)
  end

end
