class AddWidgetsToHomepage < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('Homepage').attributes.add(name: 'main_content', type: :widget)
  end
end
