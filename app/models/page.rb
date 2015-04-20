class Page < ::Obj
  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :header_image, :reference
  attribute :icon, :string
  attribute :other_content, :widgetlist
  attribute :show_in_navigation, :enum, values: ["yes", "no"]
  attribute :teaser_content, :html
  attribute :teaser_headline, :string
  attribute :title, :string

  #
  # Page (not binary)
  #
  #   title   :string
  #   content :widgets
  #
end
