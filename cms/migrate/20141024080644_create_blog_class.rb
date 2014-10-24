class CreateBlogClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Blog', 
      is_binary: false, 
      attributes: [
         {name: 'headline', type: :string}
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
    #Obj.find("/en/blog").changeObjClass to Blog
    Scrivito::ObjClass.find('Page').attributes.add(name: 'headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_content', type: :html)
  end
end
