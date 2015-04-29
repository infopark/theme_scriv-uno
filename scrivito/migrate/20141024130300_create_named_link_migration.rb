class CreateNamedLinkMigration < ::Scrivito::Migration
  def up
    Obj.create(_obj_class: 'NamedLink', _path: "/_named_links", 
      related_links: [
        Scrivito::Link.new(obj: Obj.find_by_path("/about_us"), title: "contact"),
        Scrivito::Link.new(obj: Obj.find_by_path("/search"), title: "search")
      ]
    )
  end
end
