class FillSomePages < ::Scrivito::Migration
  def up
    (1..4).each do |index|
      Image.create(_path: "/_resources/teaser_0#{index}", blob: File.new("app/assets/images/scriv-uno/teaser_0#{index}.jpg"))
    end

   ["/about_us", "/about_us/people", "/about_us/gallery", "/scrivito", "/scrivito/modify", "/scrivito/modify/widgets", "/scrivito/rails"].each do |path|
      page = Page.find_by_path(path)
      page.update(teaser_headline: "This is a sample Scrivito App. Modify it to meet your own needs!")
      page.update(teaser_content: "Begin by editing the content and trying out the widgets we have already integrated for you. Create new pages and content areas. Sort the navigation. And check it all in the preview. Once you got a feeling for it you can get to the more serious stuff like extending the page types and modifying the widget views.")
      page.update(body: [
        TwoColumnWidget.new(column_1_width: 3, column_1: [NaviWidget.new()]),
      ])
    end

  end
end
