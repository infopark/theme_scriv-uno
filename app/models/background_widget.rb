class BackgroundWidget < Widget

  def colour
    self[:colour].presence || "white"
  end

  def summary
    self.content.summary
  end

end
