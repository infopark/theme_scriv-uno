class TextWidget < Widget
  attribute :text, :html
  attribute :size, :enum, values: ['small','medium','large']

  def description_for_editor
    "Text"
  end

  def summary
    ActionController::Base.helpers.strip_tags(self.text).first(200)
  end
end
