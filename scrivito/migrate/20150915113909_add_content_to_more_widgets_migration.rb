class AddContentToMoreWidgetsMigration < Scrivito::Migration
  def up
    obj = Obj.find_by_path("/scrivito/modify/widgets")

    obj.body.first.update(
      column_2: [
        HeadlineWidget.new(headline: "Examples for Widgets and Extensions running with scrivito"),
        ThreeColumnWidget.new(
          column_1: [
            HeadlineWidget.new(headline: "Structure Widget"),
            TextWidget.new(text: '<ul><li>Section Widget</li><li>Parallax Widget</li><li>Ealstic Slider Widget</li><li>Google Maps Widget</li><li>Accordion Widget</li><li>Tab Widget</li></ul>')
          ], column_2: [
            HeadlineWidget.new(headline: "Content Widgets"),
            TextWidget.new(text: '<ul><li>Video Widget</li><li>PDF Widget</li><li>Flickr Widget</li><li>Facebook Widget</li><li>Twitter Widget</li><li>Icon Box Widget</li><li>HighlightJs Widget</li><li>Table Widget</li></ul>')
          ], column_3: [
            HeadlineWidget.new(headline: "Other"),
            TextWidget.new(text: '<ul><li>Advanced Editors</li><li>Seo Page Extender</li><li>Google Docs Importer (in development)</li></ul>')
          ]
        ),
        ThreeColumnWidget.new(
          column_1: [
            HeadlineWidget.new(headline: "Find at scrivito.com"),
            TextWidget.new(text: '<p>You can find all Widgets on <a href="https://scrivito.com/widget-gallery">scrivito.com</a> in the Widget Gallery.</p>')
          ], column_2: [
            HeadlineWidget.new(headline: "Find at rubygems"),
            TextWidget.new(text: '<p>All Widgets are open source and release over <a href="https://rubygems.org/search?utf8=%E2%9C%93&query=scrivito">rubygems.org</a>.</p>')
          ], column_3: [
            HeadlineWidget.new(headline: "Create your own"),
            TextWidget.new(text: '<p>It is easy to create your own widgets and provide them as gem. At <a href="https://scrivito.com/turning-a-widget-into-a-gem-4f2751e1430b3f7d">scrivito.com</a> you can find a torturial.</p>')
          ]
        )
      ])

    obj.update(
      teaser_headline: 'Get More Widgets',
      teaser_content: 'Easy to install, full customizable',
    )
  end
end
