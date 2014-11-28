class CreateNaviWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'NaviWidget', attributes: [
      {name: "start_obj", type: :reference},
      {name: "levels", type: :enum, values: %w(1 2 3 4)}
    ])
  end
end
