class CreateBackgroundWidgetMigration < ::Scrivito::Migration
  def up
       Scrivito::ObjClass.create(name: 'BackgroundWidget', attributes: [
         {name: 'colour', type: :enum, values: %w(blue green grey1 grey2 white)},
         {name: 'content', type: :widget},
       ])
  end
end
