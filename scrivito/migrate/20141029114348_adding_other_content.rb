class AddingOtherContent < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('Homepage').attributes.add(name: 'other_content', type: :widget)
    Scrivito::ObjClass.find('Page').attributes.add(name: 'other_content', type: :widget)
  end
end
