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
      {name: 'image', type: :reference},
      {name: 'is_company', type: :enum, values: %w(yes no)},
      {name: 'googlemap', type: :link},
      {name: 'facebook', type: :link},
      {name: 'twitter', type: :link},
      {name: 'googleplus', type: :link},
      {name: 'slideshare', type: :link},
      {name: 'pinterest', type: :link},
      {name: 'linkedin', type: :link},
      {name: 'youtube', type: :link},
      {name: 'flickr', type: :link},
      {name: 'rss', type: :link},
    ])
    Image.create(_path: "/_resources/person", blob: File.new("app/assets/images/scriv-uno/square_01.png"))
    (0..2).each do |index|
      Obj.create(_obj_class: "Person", _path: "/people/person#{index}", title: "James Doe", function: "Chief Executive Officer", 
        street: "Roadstreet 7", postal: "82049 Exampletown", country: "Germany", 
        telephone: "+49 (0)89 123 45 678", fax: "+49 (0)89 123 45 678", mobile: "+49 (0)89 123 45 678", email: "james.doe@company.com", 
        facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"), 
        twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"), 
        image: Image.find_by_path("/_resources/person")
      )
    end
    # add some diversity:
    Obj.find_by_path("/people/person1").update(
      title: "Brittany Doolittle", 
      email: "brittany.doolittle@company.com", 
      googleplus: Scrivito::Link.new(url: "http://www.googleplus.com"),
      rss: Scrivito::Link.new(url: "http://www.googleplus.com"),
      pinterest: Scrivito::Link.new(url: "http://www.googleplus.com"),
      linkedin: Scrivito::Link.new(url: "http://www.googleplus.com")
    )
    Obj.find_by_path("/people/person2").update(title: "Brit Doo", 
      email: "brit.doo@company.com", 
      slideshare: Scrivito::Link.new(url: "http://www.twitter.com")
    )

    # add a company:
    Obj.create(_obj_class: "Person", _path: "/people/company1", 
      title: "My Company", 
      street: "Roadstreet 7", postal: "82049 Exampletown", country: "Germany", 
      telephone: "+49 (0)89 123 45 678", 
      fax: "+49 (0)89 123 45 678", 
      mobile: "+49 (0)89 123 45 678", 
      email: "james.doe@company.com", 
      facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"), 
      twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"), 
      googleplus: Scrivito::Link.new(url: "http://www.googleplus.com"),
      slideshare: Scrivito::Link.new(url: "http://www.twitter.com"),
      is_company: "yes",
      googlemap: Scrivito::Link.new(url: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2432.562414844984!2d13.373995000000003!3d52.43272599999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47a84536cd2de7a9%3A0x92f5cd9b1ecd6edd!2sInfopark+AG!5e0!3m2!1sde!2sde!4v1413988739362")        
    )
    
  end
end
