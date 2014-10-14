class CreateRootObj < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Root',
      is_binary: false,
    )
    Obj.create(_obj_class: 'Root', _path: '/')
  end
end
