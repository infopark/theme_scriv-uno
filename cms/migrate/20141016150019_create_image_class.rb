class CreateImageClass < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Image',
      is_binary: true,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
      ]
    )
  end
end
