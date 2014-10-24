class AddToPageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('Page').attributes.add(name: 'headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_headline', type: :string)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'teaser_content', type: :html)
    Obj.create(_obj_class: 'Page', _path: '/en/news', title: "News")
    Obj.create(_obj_class: 'Page', _path: '/en/about_us', title: "About us")
    Obj.create(_obj_class: 'Page', _path: '/en/about_us/sub_content', title: "Sub-Content")
    Obj.create(_obj_class: 'Page', _path: '/en/about_us/next_sub_content', title: "Next-Sub-Content")
  end
end
