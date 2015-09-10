class BackgroundWidget < Widget
  attribute :colour, :string
  attribute :content, :widgetlist


  def colour
    self[:colour].presence || "white"
  end

  def summary
    self.content.summary
  end

end
