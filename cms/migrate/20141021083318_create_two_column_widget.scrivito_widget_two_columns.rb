class CreateTwoColumnWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TwoColumnWidget',
      is_binary: false,
      attributes: [
        {
          name: 'column_1',
          type: :widget,
        },
        {
          name: 'column_2',
          type: :widget,
        },
        {
          name: 'column_1_width',
          type: :string,
        },
        {
          name: 'column_2_width',
          type: :string,
        },
      ]
    )
  end
end

