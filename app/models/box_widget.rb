class BoxWidget < Widget

  def colour
    self[:colour].presence || "white"
  end

end
