class AddHomepageTitle < ::Scrivito::Migration
  def up
    h = Homepage.find_by_path('/en')
    h.update(title: "Homepage")
  end
end
