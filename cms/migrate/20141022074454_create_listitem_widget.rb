class CreateListitemWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'ListitemWidget',
      is_binary: false,
      attributes: [
        {name: 'headline', type: :string},
        {name: 'subline', type: :string},
        {name: 'content', type: :text},
        {name: 'image', type: :reference},
        {name: 'link', type: :link},
      ]
    )
  end
end
