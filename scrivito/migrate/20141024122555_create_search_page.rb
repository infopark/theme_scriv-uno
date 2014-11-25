class CreateSearchPage < ::Scrivito::Migration
  def up
       Scrivito::ObjClass.create(name: 'SearchPage', is_binary: false, attributes: [
         {name: 'content', type: :widget},
         {name: 'other_content', type: :widget},
       ])
       Obj.create(_obj_class: "SearchPage", _path: "/search", title: "Search")
  end
end
