class CreateTeaserWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TeaserWidget',
      is_binary: false,
      attributes: [
        {name: 'headline', type: :string},
        {name: 'content', type: :html},
        {name: 'image', type: :reference},
        {name: 'link_to', type: :link},
      ]
    )
  end
end

