class AddToPageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_content', type: :html)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'show_in_navigation', type: :enum, values: %w{yes no}, default: "yes")
    Obj.create(_obj_class: 'Page', _path: '/news', title: "News")
    Obj.create(_obj_class: 'Page', _path: '/about_us', title: "About us")
    Obj.create(_obj_class: 'Page', _path: '/about_us/people', title: "People")
    Obj.create(_obj_class: 'Page', _path: '/about_us/more', title: "More About us")
    Obj.create(_obj_class: 'Page', _path: '/people', title: "People Repo", show_in_navigation: "no")
  end
end
