class AddSupportContentMigration < ::Scrivito::Migration
  def up
    supportimage = Image.create(_path: "/_resources/support", blob: File.new("app/assets/images/scriv-uno/support.jpg"))
    docuimage = Image.create(_path: "/_resources/documentation", blob: File.new("app/assets/images/scriv-uno/documentation.jpg"))
    ["/scrivito", "/scrivito/modify"].each do |path|
      p = Obj.find_by_path(path)
      p.update(other_content: p.other_content << BackgroundWidget.new(colour: "grey2",
        content: [
          HeadlineWidget.new(headline: "If you get stuck ..."),
          TwoColumnWidget.new(
            column_1: [
              ListitemWidget.new(headline: "Check our Online Documentation", 
                content: "Create your own widget, or get to know the architecture. We have tutorials on how to solve common use cases along with explaining to you how to build your perfect site with Scrivito.",
                image: docuimage,
                link: Scrivito::Link.new(url: "https://scrivito.com/documentation", title: "Scrivito Documentation"))], 
            column_2: [
              ListitemWidget.new(headline: "Ask our Support Team", 
                content: "We don't like incompetent, enterprisy support. So that's why everybody in our support team is an engineer with deep knowledge of our product, committed to help you using our CMS. Just send us an e-mail at support@scrivito.com or use our ticket system. We love to help you.", 
                image: supportimage,
                link: Scrivito::Link.new(url: "https://scrivito.com/support", title: "Scrivito Support Team"))]
          )
        ] 
      ))
    end
  end
end
