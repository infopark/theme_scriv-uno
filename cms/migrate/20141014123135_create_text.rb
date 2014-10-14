class CreateText < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Text',
      is_binary: false,
      title: 'Text',
       attributes: [
         { name: 'content', type: :html },
       ]
    )
  end
end
