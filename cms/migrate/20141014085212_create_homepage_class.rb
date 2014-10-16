class CreateHomepageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Homepage',
      is_binary: false,
      attributes: [
        {name: 'locale', type: 'string'}
        {name: 'main_content', type: 'widget'}
        {name: 'title', type: 'string'}
      ]
    )
    Obj.create(_obj_class: 'Homepage', _path: '/en', title: "Homepage")
  end
end
