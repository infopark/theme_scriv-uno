class TwoColumnWidget < Widget
  attribute :column_1, :widgetlist
  attribute :column_1_width, :string
  attribute :column_2, :widgetlist
  attribute :column_2_width, :string

  attribute :column_1, :widgetlist
  attribute :column_2, :widgetlist
  attribute :column_1_width, :string
  attribute :column_2_width, :string

  def column_1_width
    self[:column_1_width].presence || '6'
  end

  def column_2_width
    self[:column_2_width].presence || '6'
  end
end