class IconListitemWidget < Widget
  attribute :content, :string
  attribute :headline, :string
  attribute :headline_level, :enum, values: ["h2", "h3", "h4"]
  attribute :icon, :string
  attribute :link, :link


  def summary
    ActionController::Base.helpers.strip_tags(self.content).first(200)
  end

end
