class CreateTableWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TableWidget',
      type: 'publication',
      is_binary: false,
      title: 'TableWidget',
      attributes: [
        {name: "table", type: "html"}
      ],
    )
  end
end
