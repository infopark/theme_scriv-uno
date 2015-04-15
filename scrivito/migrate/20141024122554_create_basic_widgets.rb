class CreateBasicWidgets < ::Scrivito::Migration
  def up

    Scrivito::ObjClass.create(name: 'NaviWidget', attributes: [
      {name: "start_obj", type: :reference},
      {name: "levels", type: :enum, values: %w(1 2 3 4)}
    ])

    Scrivito::ObjClass.create(
      name: 'ListitemWidget',
      is_binary: false,
      attributes: [
        {name: 'headline', type: :string},
        {name: 'headline_level', type: :enum, values: %w(h2 h3 h4)},
        {name: 'subline', type: :string},
        {name: 'content', type: :text},
        {name: 'image', type: :reference},
        {name: 'link', type: :link},
      ]
    )

    Scrivito::ObjClass.create(
      name: 'BoxWidget',
      is_binary: false,
      title: 'Box Widget',
      attributes: [
        {name: "colour", type: :enum, values: %w(blue green grey white)},
        {name: "content", type: :widget},
      ]
    )

  end
end
