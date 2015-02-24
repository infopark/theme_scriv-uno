class AddMoreContentMigration < ::Scrivito::Migration
  def up

    # /about_us
    you = Obj.create(_obj_class: "Person", _path: "/people/you", title: "YOU!", 
      function: "Scrivito Nerd",
      image: Image.find_by_path("/_resources/person"))    

    p = Obj.find_by_path("/about_us")
    col = p.body.first.column_2
    p.body.first.update(column_2: col << TwoColumnWidget.new(column_1_width: 4, 
      column_1: [PersonWidget.new(person: you)],
      column_2_width: 8,
      column_2: [HeadlineWidget.new(headline: "We are hiring!"),
        TextWidget.new(text: "<p>Are you looking for new challenges?</p><p>Is Ruby your native language?</p><p>Please contact us and we can find out what we can achieve together.</p>")
      ]
    ))
    bg = p.other_content.unshift(BackgroundWidget.new(
      colour: "green", 
      content: [TwoColumnWidget.new(
        column_1: [TextWidget.new(text: "<iframe src=\"//www.youtube.com/embed/07LEQi58x_4\" frameborder=\"0\" allowfullscreen></iframe>")],
        column_2: [HeadlineWidget.new(headline: "Infopark organises Relaunch"),
          TextWidget.new(text: "<p>Every year Infopark holds the Relaunch conference. See what is planned for next summer by checking out the website of <a href=\"https://relaunch-konferenz.de/\" target=\"_blank\">relaunch</a>.</p>")])]
      )
    )
    p.update(other_content: bg)

    # /scrivito/rails
    # TODO: add content
    p = Obj.find_by_path("/scrivito/rails") 
    p.update(other_content: [BackgroundWidget.new(colour: "grey2", content: [
      HeadlineWidget.new(headline: "Have you tried ..."),
      TextWidget.new(text: "")
    ])])

  end
end
