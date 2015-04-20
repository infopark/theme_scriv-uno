class HeadlineWidget < Widget
  attribute :headline, :string

  #
  # HeadlineWidget (not binary)
  #
  #   headline :string
  #

  def summary
    self.headline + " - "
  end

end
