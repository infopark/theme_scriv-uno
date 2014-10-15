class AddTextWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TextWidget',
      is_binary: false,
      attributes: [
        {
          name: 'content',
          type: :html,
        },
      ]
    )
  end
end
