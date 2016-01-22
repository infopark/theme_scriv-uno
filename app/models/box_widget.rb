class BoxWidget < Widget
  attribute :colour, :string, default: 'bg_white'
  attribute :content, :widgetlist
  attribute :show_shadow, :enum, values: ['Yes', 'No'], default: 'Yes'

  def show_shadow?
    self.show_shadow == 'Yes'
  end
end
