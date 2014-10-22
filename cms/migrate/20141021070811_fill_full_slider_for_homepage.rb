class FillFullSliderForHomepage < ::Scrivito::Migration
  def up

    # add widget to full_slider attribute of Homepage:
    fs = Homepage.default.full_slider << ElasticSliderWidget.new
    Homepage.default.update(full_slider: fs)

    # prepare Image folder:
    Page.create(_path: '/images') 

    # create panels:
    (1..3).each do |index|
      image = Image.create(_path: "/images/teaser_0#{index}", blob: File.new("app/assets/images/dummy/teaser_0#{index}.jpg"))
      panel = ElasticSliderPanelWidget.new(headline: "Example Headline #{index}", content: "Explore our new website!", image: image, button_text: 'Learn more', button_link: Scrivito::Link.new(obj: Homepage.default, title: "Link to Homepage"))
      panels = Homepage.default.full_slider[0].panels << panel
      Homepage.default.full_slider[0].update(panels: panels)
    end

    # tweak some values:
    Homepage.default.full_slider[0].panels[1].update(headline: "Give it a test run!", content: "Our new product will leave you speechless. Lots of new features to explore and a happy community constantly developing new features.", button_text: 'Sign up today')
    Homepage.default.full_slider[0].panels[2].update(headline: "One more for good measure.", content: "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.", button_text: 'Browse gallery')
  end
end
