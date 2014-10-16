class CreateSubPages < ::Scrivito::Migration
  def up
    Obj.create(_obj_class: 'Page', _path: '/en/content1/sub_content', title: "Sub-Content")
    Obj.create(_obj_class: 'Page', _path: '/en/content1/next_sub_content', title: "Next-Sub-Content")
  end
end
