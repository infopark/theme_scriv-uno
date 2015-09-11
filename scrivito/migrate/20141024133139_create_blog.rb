class CreateBlog < ::Scrivito::Migration
  def up
    Obj.create(_obj_class: 'Blog', _path: "/blog", title: "Blog")

    Obj.create(
      _obj_class: 'BlogPost',
      _path: "/blog/post1",
      title: "We have relaunched!",
      date: 3.weeks.ago,
      author: "John Doe",
      body: [
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_04")),
        TextWidget.new(text: "We have relaunched our site with Scrivito. The new look speaks for itself. But it was also fun to write our own Rails app. The ready-made widgets made it easy to come up with a great variety of content and our editors could not believe how simple it was to fill the pages with their ideas.")
      ]
    )

    Obj.create(
      _obj_class: 'BlogPost',
      _path: "/blog/post2",
      title: "Things are looking good.",
      date: 10.days.ago,
      author: "Jane Doe",
      body: [
        TextWidget.new(text: "Since our relaunch two weeks ago we get a lot of praise for our new site. Thanks, folks! We like improving things. And with the flexibility of a Rails app on our hands we will keep improving even more. Be sure to check in regularly. More content and new features to come soon."),
        ImageWidget.new(image: Image.find_by_path("/_resources/teaser_02"))
      ]
    )

    Obj.create(
      _obj_class: 'BlogPost',
      _path: "/blog/post3",
      title: "Thank you, Scrivito!",
      date: 1.day.ago,
      author: "Maxi Muster",
      body: [
        TextWidget.new(text: "<p>Dear Scrivito Team, thanks for the great service and the support during our relaunch. You made it really easy for us to love your product.</p><p>Here is a video for those of you who have not yet been introduced to the Scrivito experience.</p>"),
        IframeWidget.new(link: Scrivito::Link.new(url: "http://www.youtube.com/embed/pFCtdGtkJv0"))
      ]
    )
  end
end
