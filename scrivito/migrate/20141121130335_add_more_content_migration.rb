class AddMoreContentMigration < ::Scrivito::Migration
  def up
    Obj.create(_obj_class: "Person", _path: "/people/you", title: "YOU!", 
      function: "and what you can achieve with us",
      image: Image.find_by_path("/_resources/square_01"))    

    p = Obj.find_by_path("/about_us")
    p.update(content: p.content << TwoColumnWidget.new(column_1_width: 4, column_2_width: 8))
    p.content.last.update(column_1: [PersonWidget.new(person: Obj.find_by_path("/people/you"))])
    p.content.last.update(column_2: [
      HeadlineWidget.new(headline: "We are hiring!"),
      TextWidget.new(content: "<p>Are you looking for new challenges? No need to look further. Please contact us and together we can find out.</p>")
    ])
  end
end
