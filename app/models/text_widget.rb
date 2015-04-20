class TextWidget < Widget
  attribute :text, :html

  #
  # TextWidget (not binary)
  #
  #   content :html
  #

  def description_for_editor
    "Text"
  end

  def summary
    ActionController::Base.helpers.strip_tags(self.text).first(200)
  end

end
