class Homepage < Obj
  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :full_slider, :widgetlist
  attribute :locale, :string
  attribute :other_content, :widgetlist
  attribute :teaser, :widgetlist
  attribute :title, :string


  def self.default
    find_by_path('/')
  end

  def homepage
    self
  end

  def thumbnail_icon
    "foundicon-home"
  end

end
