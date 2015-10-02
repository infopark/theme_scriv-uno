class SearchPage < ::Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender

  attribute :content, :widgetlist
  attribute :other_content, :widgetlist
  attribute :title, :string
  attribute :body, :html


  def show_in_navigation?
    false
  end

end
