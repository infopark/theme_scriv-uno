class AddFieldsToHomepage < ::Scrivito::Migration
  def up
       Scrivito::ObjClass.find('Homepage').attributes.add(name: 'locale', type: :string)
       Scrivito::ObjClass.find('Homepage').attributes.add(name: 'cms_title', type: :string)
  end
  def down
       Scrivito::ObjClass.find('Homepage').attributes.delete('locale')
       Scrivito::ObjClass.find('Homepage').attributes.delete('cms_title')
  end
end
