class FillHomepageContent < ::Scrivito::Migration
  def up

    Homepage.default.update(child_order: [Obj.find_by_path("/about_us"), Obj.find_by_path("/blog"), Obj.find_by_path("/scrivito")])

    # upload square images:
    s1 = Image.create(_path: "/_resources/square_01", blob: File.new("app/assets/images/scriv-uno/square_01.jpg"))
    s2 = Image.create(_path: "/_resources/square_02", blob: File.new("app/assets/images/scriv-uno/square_02.jpg"))
    s3 = Image.create(_path: "/_resources/square_03", blob: File.new("app/assets/images/scriv-uno/square_03.jpg"))
    s4 = Image.create(_path: "/_resources/square_04", blob: File.new("app/assets/images/scriv-uno/square_04.jpg"))

    # TWO-COLUMN ROW
    #add two-column widget:
    Homepage.default.update(teaser: [
      TwoColumnWidget.new(
        column_1: [
          ListitemWidget.new(headline: "Built for Ruby on Rails", headline_level: "h2", 
            content: "With Scrivito, you can develop your website like you always did. On your laptop with your favorite IDE, templating language and environment. It just works \"The Rails Way\".", 
            image: s1)
        ], 
        column_2: [
          ListitemWidget.new(headline: "It's a cloud service", headline_level: "h2", 
            content: "We like to save your time so you can focus on the important things: Developing your website functionality and look. That's why we built Scrivito as a cloud service.", 
            image: s2) 
        ]
      )
    ])

    # THREE-COLUMN ROW
    #add three-column widget:
    Homepage.default.update(body: [
      ThreeColumnWidget.new(
        column_1: [
          HeadlineWidget.new(headline: "What's more"),
          ListitemWidget.new(headline: "Scalable and available", 
            content: "Distibuted over three data centres, we're always there for you.", 
            image: s3, 
          ),
          ListitemWidget.new(headline: "Act locally, work globally", content: "Multiple language support and internationalization work seamlessly, powered by Rails I18n.", image: s1),
          ListitemWidget.new(headline: "Mobile to the max", content: "Build websites for desktop computers and mobile devices.", image: s4),
        ],
        column_2: [
          AccordionWidget.new(panels: [
            AccordionPanelWidget.new(headline: "Get your content delivered. Fast.", 
              content: [TextWidget.new(text: "Your content is fast because of our great CDN. We deliver your stuff from the cloud, directly to you and your customers. No worries about server maintenance, scalability or performance. No matter whether your site is content-heavy or lightweight - it will be fast.")]
            ),
            AccordionPanelWidget.new(headline: "Bootstrap bootstraps you",
              content: [TextWidget.new(text: "<p>We love Bootstrap, so it's included right away. Just use the sample app in front of you and extend it the way you want to.</p><p>
                <a href=\"http://getbootstrap.com/\">Explore Bootstrap</a></p>")]
            ),
            AccordionPanelWidget.new(headline: "Pay as you go", 
              content: [TextWidget.new(text: "With our simple pricing scheme it's easy to choose the plan you need. Start small, grow big. There are no long-term commitments - and you can try Scrivito for free for 30 days.")]
            ),
            ]
          )
        ],
        column_3: [
          HeadlineWidget.new(headline: "Included Page Designs"), 
          TextWidget.new(text: "<p>We are using Bootstrap for this sample app and have provided some page style suggestions here:</p><p>
            <a href=\"/design/start_page_slider.html\" target=\"_blank\">Homepage</a></p>\n<p>
            <a href=\"/design/content_page.html\" target=\"_blank\">Content Page</a></p>\n<p>
            <a href=\"/design/about_page.html\" target=\"_blank\">About Page</a></p>\n<p>
            <a href=\"/design/blog_page.html\" target=\"_blank\">Blog Page</a></p>\n<p>
            <a href=\"/design/gallery_page.html\" target=\"_blank\">Gallery Page</a></p>\n<p>
            <a href=\"/design/misc_page.html\" target=\"_blank\">Misc Page (Icons, Videos)</a></p>\n<p>
            <a href=\"/design/result_page.html\" target=\"_blank\">Search Result Page</a></p>")
        ]
      )
    ])

    # add TABBED CONTENT
    tb = Homepage.default.body << TabbedContentWidget.new
    Homepage.default.update(body: tb)
    tabsw = Homepage.default.widget_from_pool(tb.last.id)

    # fill Tabbed Content:
    headline1 = "Built For Ruby on Rails"
    text1 = "<p>With Scrivito, you can develop your website like you always did. Locally on your laptop with your favorite IDE, your favorite templating langu
age, your version control system and favorite deployment environment. It just works \"The Rails Way\".</p>
          <p>Drop the Scrivito SDK, editors, and Widget gems into your app, and you're ready to go!</p>" 

    headline2 = "Your clients will love it, too"
    text2 = "<p>Your clients can edit content in place, directly on the website. Scrivito is based on widgets as the building blocks of pages. Fill widgets with your content, move them using drag and drop, cut or copy and paste them to give your pages your favorite layout.</p>
      <p>You can easily add new widgets to provide functionality for your editors which they can instantly use to keep their content up to date. Intuitively, without any training or HTML skills. And the best is: You can reuse your widgets between projects as well!</p>"
    
    headline3 = "It's a cloud service"
    text3 = "<p>We like to save your time so you can focus on the important things: Developing your website functionality and look. That's why we built Scrivito as a cloud service. So you don't have to keep on updating your CMS all the time. And you always get the latest features.</p>
      <p>We're running Scrivito on Amazon Web Services, distributed over three data centres, so your data is secure and highly available.</p>
      <p>Still, when it comes to deployment of your Scrivito Rails app, you have all options available: Locally, on AWS, on Heroku, … - it's your decision.</p>"

    # create tabs:
    (1..3).each do |index|
      image = Image.find_by_path("/_resources/teaser_0#{index}")
      tabsw.tabs << TabbedContentTabWidget.new(headline: (eval "headline#{index}"))
      tabsw.update(tabs: tabsw.tabs)
      tab = tabsw.tabs.last
      twocol = tab.content << TwoColumnWidget.new()
      tab.update(content: twocol)
      if index != 2
        text = tab.content.last.column_1 << TextWidget.new(text: (eval "text#{index}"))
        tab.content.last.update(column_1: text)
        image = tab.content.last.column_2 << ImageWidget.new(image: image)
        tab.content.last.update(column_2: image)
      else
        text = tab.content.last.column_2 << TextWidget.new(text: text2)
        tab.content.last.update(column_2: text)
        image = tab.content.last.column_1 << ImageWidget.new(image: image)
        tab.content.last.update(column_1: image)
      end
    end

  end
end
