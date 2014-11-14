class CreatePersonWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'PersonWidget', attributes: [
      {name: 'person', type: :reference}
    ])
    p = Obj.find_by_path("/about_us/people")
    p.update(content: [TextWidget.new(content: "<p>Donec risus ante, hendrerit quis rhoncus in, efficitur eget mi. Donec eu mattis lectus. Aenean egestas fermentum eros, a semper enim dictum quis. Aliquam erat volutpat. Sed dictum, odio at bibendum pulvinar, nisi ex porttitor arcu, vel posuere dui diam id diam. Suspendisse potenti. Phasellus sodales dictum lectus faucibus tristique. Vestibulum non ornare neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In dictum suscipit eleifend. Aenean ultricies tortor quis nisi euismod, id vehicula neque eleifend.</p><p>")])

    # first row of people
    p.update(content: p.content << ThreeColumnWidget.new())
    p.content[1].update(column_1: [] << PersonWidget.new(person: Obj.find_by_path("/people/person0")))
    p.content[1].update(column_2: [] << PersonWidget.new(person: Obj.find_by_path("/people/person1")))
    p.content[1].update(column_3: [] << PersonWidget.new(person: Obj.find_by_path("/people/person2")))

    # second row of people
    p.update(content: p.content << ThreeColumnWidget.new())
    p.content[2].update(column_1: [] << PersonWidget.new(person: Obj.find_by_path("/people/person1")))
    p.content[2].update(column_2: [] << PersonWidget.new(person: Obj.find_by_path("/people/person0")))
  end
end
