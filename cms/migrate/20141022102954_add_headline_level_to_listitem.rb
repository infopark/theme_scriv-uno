class AddHeadlineLevelToListitem < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.find('ListitemWidget').attributes.add(name: 'headline_level', type: :enum, values: %w(h2 h3 h4))
  end
end
