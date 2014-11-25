class BoxWidget < Widget

  def colour
    self[:colour].presence || "white"
  end

  def show_frame?
    self.show_frame != "no"
  end

  def summary
    self.content.summary
  end

end
