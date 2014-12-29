class FillHomepageFullSlider < ::Scrivito::Migration
  def up

    # add widget to full_slider attribute of Homepage:
    fs = Homepage.default.full_slider << ElasticSliderWidget.new
    Homepage.default.update(full_slider: fs)

    # prepare Image folder:
    Page.create(_path: '/_resources', show_in_navigation: "no")

    # create panels:
    (1..3).each do |index|
      panel = ElasticSliderPanelWidget.new(headline: "Welcome to our first Scrivito Theme!", 
        content: "Explore this app to see what Scrivito can do!", image: Image.find_by_path("/_resources/teaser_0#{index}"), 
        button: Scrivito::Link.new(obj: Obj.find_by_path("/scrivito"), title: "Learn more!"))
      panels = Homepage.default.full_slider[0].panels << panel
      Homepage.default.full_slider[0].update(panels: panels)
    end

    # tweak some values:
    Homepage.default.full_slider[0].panels[1].update(headline: "Start here!", 
      content: "You can use this app to develop your own. Simply start by modifying the content according to your needs. And then modify the app itself.",
      button: Scrivito::Link.new(obj: Obj.find_by_path("/scrivito/modify"), title: "Modifying the app"))
    Homepage.default.full_slider[0].panels[2].update(headline: "We already created some basics for you.", 
      content: "Check out the Blog, About us or Misc section in this app and add your own content there.", 
      button: Scrivito::Link.new(obj: Obj.find_by_path("/blog"), title: "Start with the Blog!"))

  end
end
