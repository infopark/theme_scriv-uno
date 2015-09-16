class AddGalleryBgMigration < ::Scrivito::Migration
  def up

    ["/", "/search", "/blog"].each do |path|
      p = Obj.find_by_path(path)
      p.update(other_content: p.other_content << BackgroundWidget.new(colour: "bg_green",
        content: [TwoColumnWidget.new(
          column_1: [
            ImageWidget.new(image: Image.find_by_path("/_resources/teaser_02"), show_shadow: 'Yes'),
            TextWidget.new(text: "<h3>Your new trial CMS</h3>
              <p>Sign up at <a href=\"https://scrivito.com\" target=\"_blank\">https://scrivito.com</a> to get your very own trial CMS. It is valid for 30 days and allows you to test run your own Scrivito App.</p>")
          ],
          column_2: [
            ImageWidget.new(image: Image.find_by_path("/_resources/teaser_04"), show_shadow: 'Yes'),
            TextWidget.new(text: "<h3>Scrivito Demo</h3>
            <p>Sign up at <a href=\"https://scrivito.com\" target=\"_blank\">https://scrivito.com</a> to go through the Scrivito Demo tour. Just follow the link on the Dashboard to explore Scrivito and see what it can do.</p>")
          ]
        )]
      ))
    end

    Obj.find_by_path("/about_us/gallery").update(other_content: [
      BackgroundWidget.new(colour: "bg_grey1", content: [
        HeadlineWidget.new(headline: "a list with icons"),
        TwoColumnWidget.new(column_1: [
          IconListitemWidget.new(icon: "flag", headline: "Process Walkthrough", content: "Proin iaculis purus digni consequat sem digni ssim. Donec entum digni ssim."),
          IconListitemWidget.new(icon: "plus", headline: "Customization options", content: "Aiaculis purus consequat digni sem digni ssim. Purus gni consequat sem digni ssim. Donec entum digni ssim."),
          IconListitemWidget.new(icon: "star", headline: "Process Walkthrough", content: "Proin iaculis purus digni consequat sem digni ssim. Donec entum digni ssim.")
        ], column_2: [
          IconListitemWidget.new(icon: "globe", headline: "24/7 Walkthrough", content: "Proin iaculis purus digni consequat sem digni ssim. Donec entum digni ssim."),
          IconListitemWidget.new(icon: "minus", headline: "Process Ipsum dolor sit amet", content: "Aiaculis purus consequat digni sem digni ssim. Purus gni consequat sem digni ssim. Donec entum digni ssim."),
          IconListitemWidget.new(icon: "cloud", headline: "Process Walkthrough", content: "Donec entum digni ssim. Proin iaculis purus digni consequat sem digni ssim.")
        ])
      ])
    ])

  end
end
