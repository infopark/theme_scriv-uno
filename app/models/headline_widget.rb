class HeadlineWidget < Widget
  #
  # HeadlineWidget (not binary)
  #
  #   headline :string
  #

  def summary
    self.headline + " - "
  end

end
