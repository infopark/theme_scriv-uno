class CreateSubPages < ::Scrivito::Migration
  def up
    Obj.create(_obj_class: 'Page', _path: '/en/about_us/sub_content', title: "Sub-Content")
    Obj.create(_obj_class: 'Page', _path: '/en/about_us/next_sub_content', title: "Next-Sub-Content")
  end
end
