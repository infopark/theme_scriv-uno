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
    Obj.create(_obj_class: 'Page', _path: '/en/about_us', title: "About us")
    Obj.create(_obj_class: 'Page', _path: '/en/blog', title: "Blog")
  end
end
