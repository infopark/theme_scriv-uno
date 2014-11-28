class CreatePersonWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'PersonWidget', attributes: [
      {name: 'person', type: :reference},
      {name: 'show_picture', type: :enum, values: %w(yes no)},
      {name: 'colour', type: :enum, values: %w(grey white)},
    ])
    p = Obj.find_by_path("/about_us/people")
    p.content.first.update(column_2: [TextWidget.new(content: "<p>This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team.</p>")])

    # first row of people
    col = p.content.first.column_2
    p.content.first.update(column_2: col << ThreeColumnWidget.new(
      column_1: [PersonWidget.new(person: Obj.find_by_path("/people/person0"))],
      column_2: [PersonWidget.new(person: Obj.find_by_path("/people/person1"), colour: "grey")],
      column_3: [PersonWidget.new(person: Obj.find_by_path("/people/person2"))]
    ))

    # second row of people
    col = p.content.first.column_2
    p.content.first.update(column_2: col << ThreeColumnWidget.new(
      column_1: [PersonWidget.new(person: Obj.find_by_path("/people/person1"), 
        show_picture: "no", colour: "grey")],
      column_2: [PersonWidget.new(person: Obj.find_by_path("/people/person0"), 
        show_picture: "no", colour: "grey")]
    ))

    # add the company to several pages
    ["/about_us", "/about_us/more", "/about_us/people", "/contact"].each do |path|
      p = Obj.find_by_path(path)
      col = p.content.first.column_2
      p.content.first.update(column_2: col << PersonWidget.new(person: Obj.find_by_path("/people/company1"),
      show_picture: "no", colour: "grey"))
    end
    
  end
end
