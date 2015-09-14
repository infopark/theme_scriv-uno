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
      headline: "Welcome to our first Scrivito Theme!",
      content: "Explore this app to see what Scrivito can do!",
      image: Image.find_by_path("/_resources/teaser_01"),
      button: Scrivito::Link.new(obj: Obj.find_by_path("/scrivito"), title: "Learn more!")
    ),

    panels = ElasticSliderPanelWidget.new(
      headline: "Start here!",
      content: "You can use this app to develop your own. Simply start by modifying the content according to your needs. And then modify the app itself.",
      image: Image.find_by_path("/_resources/teaser_02"),
      button: Scrivito::Link.new(obj: Obj.find_by_path("/scrivito/modify"), title: "Modifying the app")
    ),

    panels = ElasticSliderPanelWidget.new(
      headline: "We already created some basics for you.",
      content: "Check out the Blog, About us or Misc section in this app and add your own content there.",
      image: Image.find_by_path("/_resources/teaser_03"),
      button: Scrivito::Link.new(obj: Obj.find_by_path("/blog"), title: "Start with the Blog!")
    )]

    panels.each do |p|
      panel = Homepage.default.full_slider[0].panels << p
      Homepage.default.full_slider[0].update(panels: panel)
    end
  end
end
