class ListitemWidget < Widget
  attribute :content, :string
  attribute :headline, :string
  attribute :headline_level, :enum, values: ["h2", "h3", "h4"], default: 'h3'
  attribute :image, :reference
  attribute :link, :link
  attribute :subline, :string


  def summary
    ActionController::Base.helpers.strip_tags(self.content).first(200)
  end

end
