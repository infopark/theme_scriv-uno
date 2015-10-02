class Page < ::Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender

  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :header_image, :reference
  attribute :icon, :string
  attribute :other_content, :widgetlist
  attribute :show_in_navigation, :enum, values: ["Yes", "No"]
  attribute :teaser_content, :html
  attribute :teaser_headline, :string
  attribute :title, :string
end
