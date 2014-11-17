class CreateHomepageClass < ::Scrivito::Migration
  def up
   Scrivito::ObjClass.create(
      name: 'Homepage',
      is_binary: false,
      attributes: [
        {name: 'child_order', type: 'referencelist'},
        {name: 'content', type: 'widget'},
        {name: 'full_slider', type: 'widget'},
        {name: 'locale', type: 'string'},
        {name: 'teaser', type: :widget},
      ]
    )
    Page.find_by_path("/").update(_obj_class: "Homepage", title: "Home")
  end
end
