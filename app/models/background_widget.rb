class BackgroundWidget < Widget
  attribute :colour, :enum, values: ["blue", "green", "grey1", "grey2", "white"]
  attribute :content, :widgetlist


  def colour
    self[:colour].presence || "white"
  end

  def summary
    self.content.summary
  end

end
