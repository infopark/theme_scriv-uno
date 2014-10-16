class CreatePageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Page', 
      is_binary: false, 
      attributes: [
        {name: 'main_content', type: 'widget'}
      ]
    )
    Obj.create(_obj_class: 'Page', _path: '/en/news', title: "News")
    Obj.create(_obj_class: 'Page', _path: '/en/content1', title: "Content1")
    Obj.create(_obj_class: 'Page', _path: '/en/content2', title: "Content2")
  end
end
