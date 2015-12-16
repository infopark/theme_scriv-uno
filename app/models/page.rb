class Page < ::Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender

  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :show_in_navigation, :enum, values: ["Yes", "No"]
  attribute :title, :string
end
