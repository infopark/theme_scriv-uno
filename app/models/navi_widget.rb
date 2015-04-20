class NaviWidget < Widget
  attribute :levels, :enum, values: ["1", "2", "3", "4"]
  attribute :start_obj, :reference


  def description_for_editor
    "Navigation"
  end

  def summary
    ""
  end

end
