class CreateVideoWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'VideoWidget',
      is_binary: false,
      attributes: [
        {
          name: 'source',
          type: :reference,
        },
        {
          name: 'poster',
          type: :reference,
        }
      ]
    )
  end
end