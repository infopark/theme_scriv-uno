class CreateAccordionWidget < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'AccordionWidget',
      is_binary: false,
      attributes: [
        {
          name: 'panels',
          type: :widget,
        },
      ]
    )

    Scrivito::ObjClass.create(
      name: 'AccordionPanelWidget',
      is_binary: false,
      attributes: [
        {
          name: 'headline',
          type: :string,
        },
        {
          name: 'main_content',
          type: :widget,
        },
      ]
    )
  end
end