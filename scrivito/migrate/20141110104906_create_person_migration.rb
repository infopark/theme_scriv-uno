class CreatePersonMigration < ::Scrivito::Migration
  def up
    image = Image.create(blob: File.new("app/assets/images/scriv-uno/square_01.png"))
    person1 = Obj.create(
      _obj_class: "Person",
      _path: "/people/person1",
      title: "Brittany Doolittle",
      function: "Chief Executive Officer",
      street: "Roadstreet 7",
      postal: "82049 Exampletown",
      country: "Germany",
      telephone: "+49 (0)89 123 45 678",
      fax: "+49 (0)89 123 45 678",
      mobile: "+49 (0)89 123 45 678",
      email: "brittany.doolittle@company.com",
      facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"),
      twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"),
      googleplus: Scrivito::Link.new(url: "http://www.googleplus.com"),
      rss: Scrivito::Link.new(url: "http://www.googleplus.com"),
      pinterest: Scrivito::Link.new(url: "http://www.googleplus.com"),
      linkedin: Scrivito::Link.new(url: "http://www.googleplus.com"),
      image: image
    )

    person2 = Obj.create(
      _obj_class: "Person",
      _path: "/people/person2",
      title: "James Doe",
      function: "Chief Executive Officer",
      street: "Roadstreet 7",
      postal: "82049 Exampletown",
      country: "Germany",
      telephone: "+49 (0)89 123 45 678",
      fax: "+49 (0)89 123 45 678",
      mobile: "+49 (0)89 123 45 678",
      email: "brit.doo@company.com",
      facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"),
      twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"),
      slideshare: Scrivito::Link.new(url: "http://www.twitter.com"),
      image: image
    )

    person3 = Obj.create(
      _obj_class: "Person",
      _path: "/people/person0",
      title: "James Doe",
      function: "Chief Executive Officer",
      street: "Roadstreet 7",
      postal: "82049 Exampletown",
      country: "Germany",
      telephone: "+49 (0)89 123 45 678",
      fax: "+49 (0)89 123 45 678",
      mobile: "+49 (0)89 123 45 678",
      email: "james.doe@company.com",
      facebook: Scrivito::Link.new(title: "Facebook Link", url: "http://www.facebook.com"),
      twitter: Scrivito::Link.new(title: "Twitter Link", url: "http://www.twitter.com"),
      image: image
    )

    p = Obj.find_by_path("/about_us/people")
    p.body.first.update(column_2: [
      TextWidget.new(text: "<p>This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team. This is the place to introduce our team.</p>"),
      ThreeColumnWidget.new(
        column_1: [PersonWidget.new(person: person3)],
        column_2: [PersonWidget.new(person: person2, colour: "grey")],
        column_3: [PersonWidget.new(person: person1)]
      ),
      ThreeColumnWidget.new(
        column_1: [PersonWidget.new(person: person2, show_picture: "no", colour: "grey")],
        column_2: [PersonWidget.new(person: person1, show_picture: "no", colour: "grey")]
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
