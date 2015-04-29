class CreatePersonMigration < ::Scrivito::Migration
  def up
    image = Image.create(blob: File.new("app/assets/images/scriv-uno/square_01.png"))
    (0..2).each do |index|
      Obj.create(_obj_class: "Person", _path: "/people/person#{index}", title: "James Doe", function: "Chief Executive Officer", 
        street: "Roadstreet 7", postal: "82049 Exampletown", country: "Germany", 
        telephone: "+49 (0)89 123 45 678", fax: "+49 (0)89 123 45 678", mobile: "+49 (0)89 123 45 678", email: "james.doe@company.com", 
        facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"), 
        twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"), 
        image: image
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
    
    p = Obj.find_by_path("/about_us/people")
    p.body.first.update(column_2: [
      TextWidget.new(text: "<p>This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team.</p>"),
      ThreeColumnWidget.new(
        column_1: [PersonWidget.new(person: Obj.find_by_path("/people/person0"))],
        column_2: [PersonWidget.new(person: Obj.find_by_path("/people/person1"), colour: "grey")],
        column_3: [PersonWidget.new(person: Obj.find_by_path("/people/person2"))]
      ),
      ThreeColumnWidget.new(
        column_1: [PersonWidget.new(person: Obj.find_by_path("/people/person1"), 
          show_picture: "no", colour: "grey")],
        column_2: [PersonWidget.new(person: Obj.find_by_path("/people/person0"), 
          show_picture: "no", colour: "grey")]
      )
    ])

    # add the company to several pages
    ["/about_us", "/about_us/people"].each do |path|
      p = Obj.find_by_path(path)
      col = p.body.first.column_2
      p.body.first.update(column_2: col << PersonWidget.new(person: Obj.find_by_path("/people/company1"),
      show_picture: "no", colour: "grey"))
    end

    Obj.create(_obj_class: "Person", _path: "/people/you", title: "YOU!",
      function: "Scrivito Nerd",
      image: image)
    
  end
end
