class TextWidget < Widget

  def description_for_editor
    "Text"
  end

  def summary
    ActionController::Base.helpers.strip_tags(self.content).first(200)
  end

end
