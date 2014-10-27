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
    Obj.create(_obj_class: 'BlogPost', _path: "/en/blog/post1", headline: "First Blog Post", date: 3.weeks.ago, author: "John Doe", content: [
      ImageWidget.new(image: Image.find_by_path("/images/teaser_02")), 
      TextWidget.new(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    ])
    Obj.create(_obj_class: 'BlogPost', _path: "/en/blog/post2", headline: "Next Blog Post", date: 10.days.ago, author: "Jane Doe", content: [
      TextWidget.new(content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."), 
      ImageWidget.new(image: Image.find_by_path("/images/teaser_05")), 
      TextWidget.new(content: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words.")
    ])
    Obj.create(_obj_class: 'BlogPost', _path: "/en/blog/post3", headline: "Third Blog Post", date: 1.day.ago, author: "Maxi Muster")
  end
end
