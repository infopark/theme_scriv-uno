class AddFullSliderToHomepage < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('Homepage').attributes.add(name: 'full_slider', type: :widget)
  end
end
