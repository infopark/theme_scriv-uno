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
        {name: 'image_source', type: :reference},
        {name: 'headline', type: :string },
        {name: 'main_content', type: :text},
        {name: 'button_text', type: :string},
        {name: 'button_link', type: :link},
      ]
    )
  end
end
