class CreateBoxWidgetMigration < ::Scrivito::Migration
  def up
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
