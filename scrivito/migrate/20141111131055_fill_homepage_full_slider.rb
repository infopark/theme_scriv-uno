class FillHomepageFullSlider < ::Scrivito::Migration
  def up

    # add widget to full_slider attribute of Homepage:
    fs = Homepage.default.full_slider << ElasticSliderWidget.new
    Homepage.default.update(full_slider: fs)

    # prepare Image folder:
    Page.create(_path: '/_resources', show_in_navigation: "no")

    # create panels:
    (1..3).each do |index|
      image = Image.create(_path: "/_resources/teaser_0#{index}", blob: File.new("app/assets/images/dummy/teaser_0#{index}.jpg"))
      panel = ElasticSliderPanelWidget.new(headline: "Welcome to our first Scrivito Theme!", content: "Explore this app to see what Scrivito can do!", image: image, button: Scrivito::Link.new(obj: Obj.find_by_path("/scrivuno"), title: "Learn more!"))
      panels = Homepage.default.full_slider[0].panels << panel
      Homepage.default.full_slider[0].update(panels: panels)
    end

    # tweak some values:
    Homepage.default.full_slider[0].panels[1].update(headline: "Start here!", content: "You can use this app to develop your own. Just start by modifying the content according to your needs.", button: Scrivito::Link.new(obj: Obj.find_by_path("/scrivuno"), title: ""))
    Homepage.default.full_slider[0].panels[2].update(headline: "We have already created some basics for you.", content: "Check out the Blog, the News or other sections in this app and add your own content there.", button: Scrivito::Link.new(obj: Obj.find_by_path("/news"), title: "Start with the News!"))

  end
end
