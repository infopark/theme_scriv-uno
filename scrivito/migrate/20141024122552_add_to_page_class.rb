class AddToPageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_content', type: :html)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'show_in_navigation', type: :enum, values: %w{yes no}, default: "yes")
    Obj.create(_obj_class: 'Page', _path: '/about_us', title: "About us")
    Obj.create(_obj_class: 'Page', _path: '/about_us/people', title: "People")
    Obj.create(_obj_class: 'Page', _path: '/about_us/more', title: "More About us")
    Obj.create(_obj_class: 'Page', _path: '/misc', title: "Misc")
    Obj.create(_obj_class: 'Page', _path: '/misc/gallery', title: "Gallery")
    Obj.create(_obj_class: 'Page', _path: '/misc/icon_boxes', title: "Icon Boxes")
    Obj.create(_obj_class: 'Page', _path: '/scrivito', title: "Scrivito")
    Obj.create(_obj_class: 'Page', _path: '/scrivito/rails', title: "Ruby on Rails")
    Obj.create(_obj_class: 'Page', _path: '/scrivito/modify', title: "Modify this App")
    Obj.create(_obj_class: 'Page', _path: '/scrivito/modify/widgets', title: "More Widgets")
    Obj.create(_obj_class: 'Page', _path: '/scrivito/modify/attributes', title: "Attributes and Page Types")
    Obj.create(_obj_class: 'Page', _path: '/people', title: "People Repo", show_in_navigation: "no")
    Obj.create(_obj_class: 'Page', _path: '/contact', title: "Contact", show_in_navigation: "no")
  end
end
