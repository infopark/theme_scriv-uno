class CreateTabbedContentWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TabbedContentWidget',
      is_binary: false,
      attributes: [
         {name: 'tabs', type: :widget},
      ]
    )
    Scrivito::ObjClass.create(
      name: 'TabbedContentTabWidget',
      is_binary: false,
      attributes: [
         {name: 'headline', type: :string},
         {name: 'content', type: :widget},
      ]
    )
  end
end

