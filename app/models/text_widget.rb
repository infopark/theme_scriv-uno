class TextWidget < Widget
  attribute :text, :html
  attribute :size, :string, value: ['small','medium','large']

  def description_for_editor
    "Text"
  end

  def summary
    ActionController::Base.helpers.strip_tags(self.text).first(200)
  end
end
