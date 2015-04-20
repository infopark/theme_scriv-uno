class BoxWidget < Widget
  attribute :colour, :enum, values: ["blue", "green", "grey", "white"]
  attribute :content, :widgetlist


  def colour
    self[:colour].presence || "white"
  end

end
