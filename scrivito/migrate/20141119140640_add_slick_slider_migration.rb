class AddSlickSliderMigration < ::Scrivito::Migration
  def up
    ["/", "/about_us"].each do |path|
      p = Obj.find_by_path(path)
      p.update(other_content: p.other_content << BackgroundWidget.new(colour: "bg_grey1"))
      p.other_content.last.update(content: [
        HeadlineWidget.new(headline: "Our Business"),
        SlickSliderWidget.new(slides_to_show: 5, slides_to_scroll: 1)])
      # create panels:
      panels = []
      (1..4).each do |index|
        panels << SlickSliderPanelWidget.new(image: Image.find_by_path("/_resources/square_0#{index}"), link: Scrivito::Link.new(obj: Homepage.default, title: "Slider Panel #{index}"))
      end
      (1..3).each do |index|
        panels << SlickSliderPanelWidget.new(image: Image.find_by_path("/_resources/square_0#{index}"), link: Scrivito::Link.new(obj: Homepage.default, title: "Slider Panel #{index + 4}"))
      end
      p.other_content.last.content.last.update(panels: panels)
    end
  end
end
