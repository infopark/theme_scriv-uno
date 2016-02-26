class AddHomepageObjMigration < Scrivito::Migration
  def up
    Homepage.create(
      _path: '/',
      title: 'ScrivUno',
      body: [
        slider,
        section1,
        section2,
        section3,
        section5,
        section4
      ],
      child_order: child_order
    )
  end

  def child_order
    [
      Obj.find_by_permalink('this_app'),
      Obj.find_by_permalink('layout'),
      Obj.find_by_permalink('optimization'),
      Obj.find_by_permalink('login')
    ]
  end

  def slider
    ElasticSliderWidget.new(
      panels: [
        ElasticSliderPanelWidget.new(
          image: Image.find_by_permalink('teaser_image_01'),
          panel_content: [
            HeadlineWidget.new(headline: 'Getting Started', type: 'h2', size: 'h1'),
            TextWidget.new(text: '<p>This is your inintial instalation of your ScrivUno App</p><p>You can test features provided by Scrivito. This app will also guid you to the first steps on developing for Scrivito</p>'.html_safe, size: 'large'),
            SpaceWidget.new(size: 'large'),
            CallToActionWidget.new(
              action: Obj.find_by_permalink('this_app'),
              text_on_button: 'Read more about this app',
              color: 'success',
              as_block: 'Yes',
            )
          ]
        ),
        ElasticSliderPanelWidget.new(
          image: Image.find_by_permalink('teaser_image_02'),
          panel_content: [
            HeadlineWidget.new(headline: 'Content everyware', type: 'h2', size: 'h1'),
            TextWidget.new(text: '<p>In this time your customres uses different devices to access the content.</p><p>Techniques like responsive design increase the experience using your site.</p>'.html_safe, size: 'large'),
            SpaceWidget.new(size: 'large'),
            CallToActionWidget.new(
              action: Obj.find_by_permalink('layout'),
              text_on_button: 'Read more about layout',
              color: 'info',
              as_block: 'Yes',
            )
          ]
        ),
        ElasticSliderPanelWidget.new(
          image: Image.find_by_permalink('teaser_image_03'),
          panel_content: [
            HeadlineWidget.new(headline: 'Be quick at your costumers', type: 'h2', size: 'h1'),
            TextWidget.new(text: '<p>Using the power of cloud computing and CDN with Scrivito.</p><p>Advanced techniques like caching can be used to make your site faster.</p>'.html_safe, size: 'large'),
            SpaceWidget.new(size: 'large'),
            CallToActionWidget.new(
              action: Obj.find_by_permalink('optimization'),
              text_on_button: 'Read more about optimization',
              color: 'primary',
              as_block: 'Yes',
            )
          ]
        ),
      ]
    )
  end

  def section1
    SectionContentWidget.new(
      background_color: 'bg_blue',
      padding_size: 'small',
      section_content: [
        TwoColumnWidget.new(
          column_1: [
            TwoColumnWidget.new(
              column_1_width: '4',
              column_1: [ IconBoxWidget.new(
                icon: 'diamond',
                background_color: 'bg_white',
                style: 'filled-circle',
                size: 'medium',
                color: 'red'
              )],
              column_2: [
                SpaceWidget.new(size: 'small'),
                HeadlineWidget.new(headline: 'Build in ruby on rails'),
                TextWidget.new(text: 'Web development that doesn’t hurt', size: 'large')
              ]
            )
          ],
          column_2: [
            TwoColumnWidget.new(
              column_1_width: '4',
              column_1: [ IconBoxWidget.new(
                icon: 'heart',
                background_color: 'bg_white',
                style: 'filled-circle',
                size: 'medium',
                color: 'red'
              )],
              column_2: [
                SpaceWidget.new(size: 'small'),
                HeadlineWidget.new(headline: 'Your clients will love it'),
                TextWidget.new(text: 'Creation of content was never so easy', size: 'large')
              ]
            )
          ]
        )
      ]
    )
  end

  def section2
    accordion = AccordionWidget.new(
      panels: [
        AccordionPanelWidget.new(
          title: 'Form the world',
          content: [
            TextWidget.new(text: 'Scrivito provides different ways to add content. Create widgets for everything.')
          ]
        ),
        AccordionPanelWidget.new(
          title: 'Optimize the world',
          background_color: 'bg_green',
          content: [
            TextWidget.new(text: 'Getting find was never so easy and also never so hard. With scrivito you can add meta datas or optimize for search bots. Basic analytics are also theire.')
          ]
        ),
        AccordionPanelWidget.new(
          title: 'Measure the world',
          content: [
            TextWidget.new(text: 'With growing you want to know more. Many tools will help you to create a better experience for your customers.')
          ]
        ),
      ]
    )

    SectionContentWidget.new(
      section_content: [
        ThreeColumnWidget.new(
          column_1: [
            ImageWidget.new(image: Image.find_by_permalink('teaser_image_03'), show_shadow: 'Yes'),
            TextWidget.new(text: 'No, This is Patrick !!!')
          ],
          column_2: [accordion],
          column_3: [
            ImageWidget.new(image: Image.find_by_permalink('teaser_image_02'), show_shadow: 'Yes'),
            TextWidget.new(text: 'No, This is Patrick !!!')
          ]
        )
      ]
    )
  end

  def section3
    SectionContentWidget.new(
      section_content: [
        TabbedContentWidget.new(
          tabs: [
            TabbedContentTabWidget.new(
              title: 'Widgets to the max',
              content: [
                TwoColumnWidget.new(
                  column_1: [TextWidget.new(text: '<p>Scrivito comes with some content widgets out of the box. It helps you to add headlines, texts or images. You can also create your own widgets, share them with the ruby community.</p><p>We also provide many widgets for an easy start. You can find them on the scrivito page in the <a href="https://scrivito.com/widget-gallery" target="_blank">widget gallery</a>. Look at the <i>Gemfile</i> of this project and try to add a missing one.</p>')],
                  column_2: [ImageWidget.new(show_shadow: 'Yes', image: Image.find_by_permalink("teaser_image_04"))],
                )
              ]
            ),
            TabbedContentTabWidget.new(
              title: 'Dilver your Content fast',
              content: [
                TwoColumnWidget.new(
                  column_1: [ImageWidget.new(show_shadow: 'Yes', image: Image.find_by_permalink("teaser_image_02"))],
                  column_2: [TextWidget.new(text: '<p>Apps get more complex and so they are slower over the time. To speed up your app, scrivito uses a CDN provided by amazon. One big impovemnt for your app is caching.</p>')],
                )
              ]
            ),
            TabbedContentTabWidget.new(
              title: 'Boostrap your live',
              background_color: 'bg_blue',
              content: [
                TwoColumnWidget.new(
                  column_1: [ImageWidget.new(show_shadow: 'Yes', image: Image.find_by_permalink("teaser_image_01"))],
                  column_2: [TextWidget.new(text: 'Your customers are everyware. Never forget this. They also use many different devices. A resoponsive webpage is mostly a must have in these days.')],
                )
              ]
            )
          ]
        )
      ]
    )
  end

  def section5
    SectionParallaxWidget.new(
      background_image: Image.find_by_permalink('teaser_image_04'),
      height: '70vh',
      speed: 'fixed'
    )
  end

  def section4
    SectionContentWidget.new(
      background_color: 'bg_green',
      section_content: [
        TextWidget.new(text: '<h2>Featured Widgets</h2>'),
        ThreeColumnWidget.new(
          column_1: [
            ImageWidget.new(image: Image.find_by_permalink('teaser_image_02')),
            TextWidget.new(text: '<h3>SectionWidgets</h3>'),
            TextWidget.new(text: 'A widget to sectionize your content where you can define selectable backgrounds.')
          ],
          column_2: [
            ImageWidget.new(image: Image.find_by_permalink('teaser_image_01')),
            TextWidget.new(text: '<h3>IconBoxWidget</h3>'),
            TextWidget.new(text: 'A widget for an icon out of 500 with selectable color.')
          ],
          column_3: [
            ImageWidget.new(image: Image.find_by_permalink('teaser_image_04')),
            TextWidget.new(text: '<h3>TimelineWidget</h3>'),
            TextWidget.new(text: 'A widget to create a timeline over your history.')
          ]
        )
      ]
    )
  end
end
