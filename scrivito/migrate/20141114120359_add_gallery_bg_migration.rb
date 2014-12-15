class AddGalleryBgMigration < ::Scrivito::Migration
  def up

    Scrivito::ObjClass.find('Blog').attributes.add(name: 'other_content', type: :widget)

    ["/", "/search", "/blog"].each do |path|
      p = Obj.find_by_path(path)
      p.update(other_content: p.other_content << BackgroundWidget.new(colour: "green",
        content: [TwoColumnWidget.new(
          column_1: [
            ImageWidget.new(image: Image.find_by_path("/_resources/teaser_02")),
            TextWidget.new(text: "<h3>Your new trial CMS</h3>
              <p>Sign up at <a href=\"https://scrivito.com\" target=\"_blank\">https://scrivito.com</a> to get your very own trial CMS. It is valid for 30 days and allows you to test run your own Scrivito App.</p>")
          ],
          column_2: [
            ImageWidget.new(image: Image.find_by_path("/_resources/teaser_05")),
            TextWidget.new(text: "<h3>Scrivito Demo</h3>
            <p>Sign up at <a href=\"https://scrivito.com\" target=\"_blank\">https://scrivito.com</a> to go through the Scrivito Demo tour. Just follow the link on the Dashboard to explore Scrivito and see what it can do.</p>")
          ] 
        )]
      ))
    end

  end
end
