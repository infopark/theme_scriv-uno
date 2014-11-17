class CreateSlickSliderWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'SlickSliderWidget',
      type: 'publication',
      title: 'Slick Slider',
      attributes: [
        {name: 'panels', type: :widget},
      ]
    )
    Scrivito::ObjClass.create(
      name: 'SlickSliderPanelWidget',
      type: 'publication',
      title: 'Slick Slider Panel',
      attributes: [
        {name: 'image', type: :reference},
        {name: 'link', type: :link},
      ]
    )
  end
end
