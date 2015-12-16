class Homepage < Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender

  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :title, :string

  def self.default
    Homepage.all.first
  end

  def homepage
    self
  end

  def thumbnail_icon
    "foundicon-home"
  end
end
