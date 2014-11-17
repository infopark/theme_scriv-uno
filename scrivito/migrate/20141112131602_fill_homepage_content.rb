class FillHomepageContent < ::Scrivito::Migration
  def up

    Homepage.default.update(child_order: [Obj.find_by_path("/about_us"), Obj.find_by_path("/blog"), Obj.find_by_path("/misc"), Obj.find_by_path("/scrivito")])

    # upload emtpy grey image:
    Image.create(_path: "/_resources/grey", blob: File.new("app/assets/images/scriv-uno/grey.png"))

    # TWO-COLUMN ROW
    #add two-column widget:
    Homepage.default.update(teaser: [TwoColumnWidget.new])

    #fill two-column widget with listitem widgets:
    left = ListitemWidget.new(headline: "Built for Ruby on Rails", headline_level: "h2", 
      content: "With Scrivito, you can develop your website like you always did. On your laptop with your favorite IDE, templating language and environment. It just works \"The Rails Way\".", 
      image: Image.find_by_path("/_resources/grey"))
    right = ListitemWidget.new(headline: "It's a cloud service", headline_level: "h2", 
      content: "We like to save your time so you can focus on the important things: Developing your website functionality and look. That's why we built Scrivito as a cloud service.", 
      image: Image.find_by_path("/_resources/grey")) 
    Homepage.default.teaser[0].update(column_1: [left])
    Homepage.default.teaser[0].update(column_2: [right])

    # THREE-COLUMN ROW
    #add three-column widget:
    Homepage.default.update(content: [ThreeColumnWidget.new])

    #fill three-column widget with widgets:
    cont = Homepage.default.content[0]
    # left:
    left_one = HeadlineWidget.new(headline: "What's more")
    left_two = ListitemWidget.new(headline: "Scalable and available", 
      content: "Distibuted over three data centres, we're always there for you.", 
      image: Image.find_by_path("/_resources/grey"), 
    )
    left_three = ListitemWidget.new(headline: "Act locally, work globally", content: "Multiple language support and internationalization work seamlessly, powered by Rails I18n.", image: Image.find_by_path("/_resources/grey"))
    left_four = ListitemWidget.new(headline: "Mobile to the max", content: "Build websites for desktop computers and mobile devices.", image: Image.find_by_path("/_resources/grey"))
    cont.update(column_1: [left_one, left_two, left_three, left_four])

    # middle:
    cont.update(column_2: [AccordionWidget.new()])
    panel1 = AccordionPanelWidget.new(headline: "Get your content delivered. Fast.", 
      content: [TextWidget.new(content: "Your content is fast because of our great CDN. We deliver your stuff from the cloud, directly to you and your customers. No worries about server maintenance, scalability or performance. No matter whether your site is content-heavy or lightweight - it will be fast.")]
    )
    panel2 = AccordionPanelWidget.new(headline: "Bootstrap bootstraps you",
      content: [TextWidget.new(content: "<p>We love Bootstrap, so it's included right away. Just use the sample app in front of you and extend it the way you want to.</p><p>
        <a href=\"http://getbootstrap.com/\">Explore Bootstrap</a></p>")]
    )
    panel3 = AccordionPanelWidget.new(headline: "Pay as you go", 
      content: [TextWidget.new(content: "With our simple pricing scheme it's easy to choose the plan you need. Start small, grow big. There are no long-term commitments - and you can try Scrivito for free for 30 days.")]
    )
    cont.column_2[0].update(panels: [panel1, panel2, panel3]) 

    cont.update(column_3: [
      HeadlineWidget.new(headline: "Included Page Designs"), 
      TextWidget.new(content: "<p>We are using Bootstrap for this sample app and have provided some page style suggestions here:</p><p>
        <a href=\"/design/start_page_slider.html\" target=\"_blank\">Homepage</a></p>\n<p>
        <a href=\"/design/content_page.html\" target=\"_blank\">Content Page</a></p>\n<p>
        <a href=\"/design/about_page.html\" target=\"_blank\">About Page</a></p>\n<p>
        <a href=\"/design/blog_page.html\" target=\"_blank\">Blog Page</a></p>\n<p>
        <a href=\"/design/gallery_page.html\" target=\"_blank\">Gallery Page</a></p>\n<p>
        <a href=\"/design/misc_page.html\" target=\"_blank\">Misc Page (Icons, Videos)</a></p>\n<p>
        <a href=\"/design/result_page.html\" target=\"_blank\">Search Result Page</a></p>")
    ])

    # add TABBED CONTENT
    tb = Homepage.default.content << TabbedContentWidget.new
    Homepage.default.update(content: tb)
    tabsw = Homepage.default.widget_from_pool(tb.last.id)

    # fill Tabbed Content:
    # create tabs:
    (1..3).each do |index|
      image = Image.create(_path: "/_resources/teaser_0#{index + 3}", blob: File.new("app/assets/images/scriv-uno/teaser_0#{index + 3}.jpg"))
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
