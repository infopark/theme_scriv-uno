class CreatePersonClassMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'Person', attributes: [
      {name: 'title', type: :string},
      {name: 'function', type: :string},
      {name: 'street', type: :string},
      {name: 'postal', type: :string},
      {name: 'country', type: :string},
      {name: 'telephone', type: :string},
      {name: 'fax', type: :string},
      {name: 'mobile', type: :string},
      {name: 'email', type: :string},
      {name: 'facebook', type: :link},
      {name: 'twitter', type: :link},
      {name: 'googleplus', type: :link},
      {name: 'slideshare', type: :link},
      {name: 'image', type: :reference},
    ])
    Image.create(_path: "/_resources/square_01", blob: File.new("app/assets/images/scriv-uno/square_01.png"))
    (0..2).each do |index|
      Obj.create(_obj_class: "Person", _path: "/people/person#{index}", title: "James Doe", function: "Chief Executive Officer", 
        street: "Roadstreet 7", postal: "82049 Exampletown", country: "Germany", 
        telephone: "+49 (0)89 123 45 678", fax: "+49 (0)89 123 45 678", mobile: "+49 (0)89 123 45 678", email: "james.doe@company.com", 
        facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"), 
        twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"), 
        image: Image.find_by_path("/_resources/square_01")
      )
    end
    # add some diversity:
    Obj.find_by_path("/people/person1").update(title: "Brittany Doolittle", email: "brittany.doolittle@company.com", googleplus: Scrivito::Link.new(url: "http://www.googleplus.com"))
    Obj.find_by_path("/people/person2").update(title: "Brit Doo", email: "brit.doo@company.com", slideshare: Scrivito::Link.new(url: "http://www.twitter.com"), fax: "")
  end
end
