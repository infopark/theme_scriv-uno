class CreateBlogClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Blog',
      is_binary: false,
      attributes: [
         {name: 'headline', type: :string},
         {name: 'content', type: :widget}
      ]
    )
    Scrivito::ObjClass.create(
      name: 'BlogPost',
      is_binary: false,
      attributes: [
         {name: 'headline', type: :string},
         {name: 'date', type: :date},
         {name: 'author', type: :string},
         {name: 'content', type: :widget}
      ]
    )
    Obj.create(_obj_class: 'Blog', _path: "/en/blog", title: "Blog", headline: "Blog")
  end
end
