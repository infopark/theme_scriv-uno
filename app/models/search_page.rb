class SearchPage < ::Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender

  attribute :body, :widgetlist
  attribute :title, :string

  def show_in_navigation?
    false
  end
end
