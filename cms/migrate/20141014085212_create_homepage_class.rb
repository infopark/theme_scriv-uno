class CreateHomepageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Homepage',
      is_binary: false,
    )
    Obj.create(_obj_class: 'Homepage', _path: '/en')
  end
end
