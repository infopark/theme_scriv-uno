class CreateObjClasses < ::Scrivito::Migration
  def up
   Scrivito::ObjClass.create(
      name: 'Homepage',
      attributes: [
        {name: 'child_order', type: 'referencelist'},
        {name: 'body', type: 'widget'},
        {name: 'full_slider', type: 'widget'},
        {name: 'locale', type: 'string'},
        {name: 'other_content', type: :widget},
        {name: 'teaser', type: :widget},
        {name: 'title', type: :string},
      ]
    )
    Page.find_by_path("/").update(_obj_class: "Homepage", title: "Home")

    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_content', type: :html)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'header_image', type: :reference)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'icon', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'other_content', type: :widget)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'show_in_navigation', type: :enum, values: %w{yes no}, default: "yes")

    Scrivito::ObjClass.create(name: 'SearchPage', is_binary: false, attributes: [
      {name: 'content', type: :widget},
      {name: 'other_content', type: :widget},
    ])

  end
end
