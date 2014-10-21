class CreateImageWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'ImageWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :reference,
        },
        {
          name: 'align',
          type: :enum,
          values: %w(left center right),
        },
      ]
    )
  end
end
