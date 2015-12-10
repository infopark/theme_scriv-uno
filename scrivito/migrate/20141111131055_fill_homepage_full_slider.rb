class FillHomepageFullSlider < ::Scrivito::Migration
  def up

    # add widget to full_slider attribute of Homepage:
    slider = ElasticSliderWidget.new
    fs = Homepage.default.full_slider << slider
    Homepage.default.update(full_slider: fs)

    # prepare Image folder:
    Page.create(_path: '/_resources', show_in_navigation: "No")

    # create panels:
    panels = [ElasticSliderPanelWidget.new(
      panel_content: [
        HeadlineWidget.new(headline: "Welcome to our first Scrivito Theme!", size: 'h1'),
        HeadlineWidget.new(headline: "Explore this app to see what Scrivito can do!", size: 'h3'),
      ],
      image: Image.find_by_path("/_resources/teaser_01")
    ),

    panels = ElasticSliderPanelWidget.new(
      panel_content: [
        HeadlineWidget.new(headline: "Start here!", size: 'h1'),
        HeadlineWidget.new(headline: "You can use this app to develop your own. Simply start by modifying the content according to your needs. And then modify the app itself.", size: 'h3')
      ],
      image: Image.find_by_path("/_resources/teaser_02")
    ),

    panels = ElasticSliderPanelWidget.new(
      panel_content: [
        HeadlineWidget.new(headline: "We already created some basics for you.", size: 'h1'),
        HeadlineWidget.new(headline: "Check out the Blog, About us or Misc section in this app and add your own content there.", size: 'h3')
      ],
      image: Image.find_by_path("/_resources/teaser_03")
    )]

    Homepage.default.full_slider[0].update(panels: [])

    panels.each do |p|
      panel = Homepage.default.full_slider[0].panels << p
      Homepage.default.full_slider[0].update(panels: panel)
    end
  end
end
