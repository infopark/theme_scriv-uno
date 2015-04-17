class CreateBasicWidgets < ::Scrivito::Migration
  def up

    Scrivito::ObjClass.create(name: 'BackgroundWidget', attributes: [
      {name: 'colour', type: :enum, values: %w(blue green grey1 grey2 white)},
      {name: 'content', type: :widget},
    ])

    Scrivito::ObjClass.create(
      name: 'BoxWidget',
      is_binary: false,
      title: 'Box Widget',
      attributes: [
        {name: "colour", type: :enum, values: %w(blue green grey white)},
        {name: "content", type: :widget},
      ]
    )

    Scrivito::ObjClass.create(name: 'IframeWidget', attributes: [
      {name: 'link', type: :link},
      {name: 'height', type: :string},
      {name: 'width', type: :string},
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
      name: 'IconListitemWidget',
      is_binary: false,
      attributes: [
        {name: 'headline', type: :string},
        {name: 'headline_level', type: :enum, values: %w(h2 h3 h4)},
        {name: 'content', type: :text},
        {name: 'icon', type: :string},
        {name: 'link', type: :link},
      ]
    )

    Scrivito::ObjClass.create(name: 'NaviWidget', attributes: [
      {name: "start_obj", type: :reference},
      {name: "levels", type: :enum, values: %w(1 2 3 4)}
    ])

  end
end
