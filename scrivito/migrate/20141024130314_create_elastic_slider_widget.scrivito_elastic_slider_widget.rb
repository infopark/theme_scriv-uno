class CreateElasticSliderWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'ElasticSliderWidget',
      is_binary: false,
      attributes: [
        {name: 'panels', type: :widget},
      ]
    )
    Scrivito::ObjClass.create(
      name: 'ElasticSliderPanelWidget',
      is_binary: false,
      attributes: [
        {name: 'image', type: :reference},
        {name: 'headline', type: :string },
        {name: 'content', type: :text},
        {name: 'button', type: :link},
      ]
    )
  end
end
