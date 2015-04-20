class ThreeColumnWidget < Widget
  attribute :column_1, :widgetlist
  attribute :column_1_width, :string
  attribute :column_2, :widgetlist
  attribute :column_2_width, :string
  attribute :column_3, :widgetlist
  attribute :column_3_width, :string

  attribute :column_1, :widgetlist
  attribute :column_2, :widgetlist
  attribute :column_3, :widgetlist
  attribute :column_1_width, :string
  attribute :column_2_width, :string
  attribute :column_3_width, :string

  def column_1_width
    self[:column_1_width].presence || '4'
  end

  def column_2_width
    self[:column_2_width].presence || '4'
  end

  def column_3_width
    self[:column_3_width].presence || '4'
  end
end