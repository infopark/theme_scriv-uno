class AddLightboxToImageWidgetMigration < Scrivito::Migration
  def up
    Obj.find_by_path("/about_us/gallery").update(body: [
      HeadlineWidget.new(headline: "Image Gallery"),
      ThreeColumnWidget.new(column_1: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_01"), show_in_lightbox: "yes"),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_04"), show_in_lightbox: "yes")
      ], column_2: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_04"), show_in_lightbox: "yes"),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_02"), show_in_lightbox: "yes")
      ], column_3: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_03"), show_in_lightbox: "yes"),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_01"), show_in_lightbox: "yes")
      ]),
      HeadlineWidget.new(headline: "Video Gallery"),
      TwoColumnWidget.new(column_1_width: 3, column_2: [
        IframeWidget.new(link: Scrivito::Link.new(url: "http://www.youtube.com/embed/pFCtdGtkJv0")),
        HeadlineWidget.new(headline: "More Videos"),
        ListitemWidget.new(headline: "Infopark organises Relaunch", image: Image.find_by_path("/_resources/teaser_02"), content: "Every year Infopark holds the Relaunch conference. See what is planned for next summer by checking out the website of <a href=\"https://relaunch-konferenz.de/\" target=\"_blank\">relaunch</a>.")
      ])
    ])
  end
end
