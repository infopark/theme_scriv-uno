class CreateHomepageClass < ::Scrivito::Migration
  def up
   Scrivito::ObjClass.create(
      name: 'Homepage',
      attributes: [
        {name: 'child_order', type: 'referencelist'},
        {name: 'body', type: 'widget'},
        {name: 'full_slider', type: 'widget'},
        {name: 'locale', type: 'string'},
        {name: 'teaser', type: :widget},
        {name: 'title', type: :string},
      ]
    )
    Page.find_by_path("/").update(_obj_class: "Homepage", title: "Home")
  end
end
