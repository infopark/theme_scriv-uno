class ContentForAboutThisAppMigration < Scrivito::Migration
  def up
    Obj.find_by_permalink('this_app').update(body: [
      header_section,
      section1,
      section2,
      section3,
      section4,
      section5,
      footer
    ])
  end

  def header_section
    SectionContentWidget.new(
      background_color: 'bg_image1',
      padding_size: 'small',
      section_content: [
        HeadlineWidget.new(headline: 'Customize your ScrivUno installation - About this app', type: 'h1')
      ]
    )
  end

  def section1
    SectionContentWidget.new(
      section_content: [
        HeadlineWidget.new(headline: 'Login and edit'),
        TextWidget.new(text: '<p>If not done, log in to this page to activate the editors mode.</p><p>On top of the page you see the Scrivito panel. Here you can create a new workspace, go to the edit mode to change your content and release it.</p>'.html_safe),
        TextWidget.new(text: '<p>At the <a href="https://scrivito.com/user-guide" target="_blank">Scrivito user-guid</a> you can find more informations about this bar.</p>'),
        SpaceWidget.new(),
        TextWidget.new(text: '<p>After login and createing a workspace you can edit the content on the page only by clicking on it.</p><p>You will see many green marker. There you can insert new widgets or edit further attributes.</p>')
      ]
    )
  end

  def section2
    SectionContentWidget.new(
      background_color: 'bg_grey1',
      section_content: [
        HeadlineWidget.new(headline: 'Change login method'),
        TwoColumnWidget.new(
          column_1: [
            TextWidget.new(text: '<p>If you look at the code of this app, you will find contoller named SeesionsController. Here is a simple way to change the credentials to login.</p><p>You can change this code to your needed login code. Login against a CRM, Google or ldap can be created for example.</p>')
          ],
          column_2: [
            HighlightjsWidget.new(code: "def valid_credentials?(login, password)\n  login == 'login' && password == 'password'\nend")
          ]
        )
      ]
    )
  end

  def section3
    SectionContentWidget.new(
      section_content: [
        HeadlineWidget.new(headline: 'Creating widgets'),
        TwoColumnWidget.new(
          column_1: [
            TextWidget.new(text: '<p>One big feature of scrivito are widgets. You can add reade to use widgets as gem or create your own widgets.</p>'),
            TextWidget.new(text: '<p>You can find more details at the <a href="https://scrivito.com/creating-and-modifying-object-classes-714e85951cceebd2" target="_blank">create and modifying object classes tutorial</a> at scrivito.com.</p>'),
            TextWidget.new(text: '<p>You can also look at how you <a href="https://scrivito.com/turning-a-widget-into-a-gem-4f2751e1430b3f7d" target="_blank">turn a widget into a gem</a>.</p>')
          ],
          column_2: [
            TextWidget.new(text: 'Open the terminal, change to the app directory and insert the following command to create a widget named <i>my_first_widget</i>:'),
            HighlightjsWidget.new(code: 'rails g scrivito:migrate my_first_widget'),
            TextWidget.new(text: '<p>This will generate all files needed. In the models folder you will find the file <i>my_first_widget.rb</i> Here you can add some attributes.</p><p>In the view folder there is a folder created which contains the views for you new widget. You should change them. After this, you widget will be available in the widget selection dialog.</p>')
          ]
        )
      ]
    )
  end

  def section4
    SectionContentWidget.new(
      background_color: 'bg_grey1',
      section_content: [
        HeadlineWidget.new(headline: 'Adding widgets and more as gem'),
        TwoColumnWidget.new(
          column_1: [
            TextWidget.new(text: 'You can finde some widgets in the <a href="https://scrivito.com/widget-gallery" target="_blank">widget gallery</a>. You can add them easily in your <i>Gemfile</i>.')
          ],
          column_2: [
            TextWidget.new(text: 'If you need meta tags, twitter cards or open graph, you can add the <a href="https://github.com/Scrivito/scrivito_seo_page_extender" target="_blank">SEO Page Extender gem</a>.')
          ]
        )
      ]
    )
  end

  def section5
    SectionContentWidget.new(
      section_content: [
        HeadlineWidget.new(headline: 'Interesting widgets that are used by ScrivUno'),
        SpaceWidget.new(size: 'small'),
        ThreeColumnWidget.new(
          column_1: [
            BoxWidget.new(
              colour: 'bg_grey3',
              content: [
                HeadlineWidget.new(headline: 'SectionWidgets', type: 'h4'),
                TextWidget.new(text: 'This gem adds Scrivito widgets for sections, header videos and parallax effects to your app.'),
                SpaceWidget.new(size: 'large'),
                TextWidget.new(text: '<a href="https://github.com/Scrivito/scrivito_section_widget" target="_blank" class="btn btn-info btn-block">More informations on GitHub</a>')
              ]
            )
          ],
          column_2: [
            BoxWidget.new(
              colour: 'bg_grey3',
              content: [
                HeadlineWidget.new(headline: 'IconBoxWidget', type: 'h4'),
                TextWidget.new(text: 'A Scrivito widget showing an icon in a box. The icon color, background color, the icon, size and the shape can be selected. For the icons, Font Awesome is used.'),
                SpaceWidget.new(size: 'small'),
                TextWidget.new(text: '<a href="https://github.com/Scrivito/scrivito_icon_box_widget" target="_blank" class="btn btn-info btn-block">More informations on GitHub</a>')
              ]
            )
          ],
          column_3: [
            BoxWidget.new(
              colour: 'bg_grey3',
              content: [
                HeadlineWidget.new(headline: 'SlickSliderWidget', type: 'h4'),
                TextWidget.new(text: 'This gem adds a Slick Slider to your Scrivito app. It is full responsive and adjustable in speed and content.'),
                SpaceWidget.new(size: 'medium'),
                TextWidget.new(text: '<a href="https://github.com/Scrivito/scrivito_slick_slider_widget" target="_blank" class="btn btn-info btn-block">More informations on GitHub</a>')
              ]
            )
          ]
        )
      ]
    )
  end

  def footer
    SectionContentWidget.new(
      background_color: 'bg_green',
      padding_size: 'small',
      section_content: [
        HeadlineWidget.new(headline: 'This could also be interesting for you')
      ]
    )
  end
end
