class FillHomepageContent < ::Scrivito::Migration
  def up
    # upload emtpy grey image:
    Image.create(_path: "/_resources/grey", blob: File.new("app/assets/images/dummy/grey.png"))

    # TWO-COLUMN ROW
    #add two-column widget:
    Homepage.default.update(content: [TwoColumnWidget.new])

    #fill two-column widget with listitem widgets:
    left = ListitemWidget.new(headline: "Headline of left Content", headline_level: "h2", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...", image: Image.find_by_path("/_resources/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "Click!"))
    right = ListitemWidget.new(headline: "Headline of Content on the right", headline_level: "h2", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...", image: Image.find_by_path("/_resources/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "More info"))
    col1 = Homepage.default.content[0].column_1 << left
    Homepage.default.content[0].update(column_1: col1)
    col2 = Homepage.default.content[0].column_2 << right
    Homepage.default.content[0].update(column_2: col2)

    # THREE-COLUMN ROW
    #add three-column widget:
    threecol = Homepage.default.content << ThreeColumnWidget.new
    Homepage.default.update(content: threecol)

    #fill three-column widget with widgets:
    left_one = HeadlineWidget.new(headline: "Latest News")
    left_two = ListitemWidget.new(headline: "Headline first item", subline: "Chicago, 22.-30.01", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum ...", image: Image.find_by_path("/_resources/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "Click!"))
    left_three = ListitemWidget.new(headline: "Headline of Content ", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte ...", image: Image.find_by_path("/_resources/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "More info"))
    left_four = ListitemWidget.new(headline: "Headline of Content ", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte lorem ipsum...", image: Image.find_by_path("/_resources/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "More info"))

    col1 = Homepage.default.content[1].column_1 << left_one << left_two << left_three << left_four
    Homepage.default.content[1].update(column_1: col1)

    middle = AccordionWidget.new()
    col2 = Homepage.default.content[1].column_2 << middle
    Homepage.default.content[1].update(column_2: col2)

    # create panels:
    (1..3).each do |index|
      panel = AccordionPanelWidget.new(headline: "Collapsible Headline #{index}")
      panels = Homepage.default.content[1].column_2[0].panels << panel
      Homepage.default.content[1].column_2[0].update(panels: panels)
      panelwidget = TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.")
      p = Homepage.default.content[1].column_2[0].panels[index - 1].content << panelwidget
      Homepage.default.content[1].column_2[0].panels[index - 1].update(content: p)
    end

    Homepage.default.content[1].update(column_3: [
      HeadlineWidget.new(headline: "Page Designs"), 
      TextWidget.new(content: "<p>
        <a href=\"/design/start_page_slider.html\" target=\"_blank\">Homepage</a></p>\n<p>
        <a href=\"/design/content_page.html\" target=\"_blank\">Content Page</a></p>\n<p>
        <a href=\"/design/about_page.html\" target=\"_blank\">About Page</a></p>\n<p>
        <a href=\"/design/blog_page.html\" target=\"_blank\">Blog Page</a></p>\n<p>
        <a href=\"/design/gallery_page.html\" target=\"_blank\">Gallery Page</a></p>\n<p>
        <a href=\"/design/misc_page.html\" target=\"_blank\">Misc Page (Icons, Videos)</a></p>\n<p>
        <a href=\"/design/result_page.html\" target=\"_blank\">Search Result Page</a></p>"),
      TeaserWidget.new(headline: 'Lorem ipsum', content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")])

    # add TABBED CONTENT
    tb = Homepage.default.content << TabbedContentWidget.new
    Homepage.default.update(content: tb)
    tabsw = Homepage.default.widget_from_pool(tb.last.id)

    # fill Tabbed Content:
    # create tabs:
    (1..3).each do |index|
      image = Image.create(_path: "/_resources/teaser_0#{index + 4}", blob: File.new("app/assets/images/dummy/teaser_0#{index + 4}.jpg"))
      tabsw.tabs << TabbedContentTabWidget.new(headline: "Built For Ruby on Rails")
      tabsw.update(tabs: tabsw.tabs)
      tab = tabsw.tabs.last
      twocol = tab.content << TwoColumnWidget.new()
      tab.update(content: twocol)
      if index != 2
        text = tab.content.last.column_1 << TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.")
        tab.content.last.update(column_1: text)
        image = tab.content.last.column_2 << ImageWidget.new(image: image)
        tab.content.last.update(column_2: image)
      else
        text = tab.content.last.column_2 << TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.")
        tab.content.last.update(column_2: text)
        image = tab.content.last.column_1 << ImageWidget.new(image: image)
        tab.content.last.update(column_1: image)
      end
    end

    tabsw.tabs[1].update(headline: "Your clients will love it, too!")
    tabsw.tabs[1].update(headline: "It's a cloud service.")

  end
end
