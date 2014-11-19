class AddSlickSliderMigration < ::Scrivito::Migration
  def up
    ["/", "/about_us", "/about_us/more", "/contact", "/misc", "/search"].each do |path|
      p = Obj.find_by_path(path)
      p.update(other_content: p.other_content << BackgroundWidget.new(colour: "grey1"))
      p.other_content.last.update(content: [SlickSliderWidget.new])
      # create panels:
      panels = []
      (1..6).each do |index|
        panels << SlickSliderPanelWidget.new(image: Image.find_by_path("/_resources/teaser_0#{index}"), link: Scrivito::Link.new(obj: Homepage.default, title: "Slider Panel #{index}"))
      end
      p.other_content.last.content.first.update(panels: panels)
    end
  end
end
