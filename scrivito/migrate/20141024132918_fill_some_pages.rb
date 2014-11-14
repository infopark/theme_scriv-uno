class FillSomePages < ::Scrivito::Migration
  def up
    image = Image.create(_path: "/_resources/teaser_07", blob: File.new("app/assets/images/scriv-uno/teaser_07.jpg"))
   ["/about_us", "/about_us/people", "/about_us/more", "/contact", "/misc", "/misc/gallery", "/misc/icon_boxes", "/scrivito", "/scrivito/modify"].each do |path|
      page = Page.find_by_path(path)
      page.update(teaser_headline: "This is a sample Scrivito App. Modify it to meet your own needs!")
      page.update(teaser_content: "Begin by editing the content and trying out the widgets we have already integrated for you. Create new pages and content areas. Sort the navigation. And check it all in the preview. Once you got a feeling for it you can get to the more serious stuff like extending the page types and modifying the widget views.")
      page.update(content: [
        TextWidget.new(content: "<p>Donec risus ante, hendrerit quis rhoncus in, efficitur eget mi. Donec eu mattis lectus. Aenean egestas fermentum eros, a semper enim dictum quis. Aliquam erat volutpat. Sed dictum, odio at bibendum pulvinar, nisi ex porttitor arcu, vel posuere dui diam id diam. Suspendisse potenti. Phasellus sodales dictum lectus faucibus tristique. Vestibulum non ornare neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In dictum suscipit eleifend. Aenean ultricies tortor quis nisi euismod, id vehicula neque eleifend.</p><p>

Phasellus ullamcorper purus sed justo pretium laoreet. Sed nunc felis, mattis et elit vitae, pretium rutrum ipsum. Morbi eu orci ut leo feugiat luctus. Cras ultricies consectetur sem eu dapibus. In lacinia volutpat commodo. Nullam semper tempor odio, ac porta tellus luctus in. Ut consectetur, metus id scelerisque hendrerit, lorem odio commodo sapien, sed commodo mauris eros nec purus. Quisque in convallis ipsum. Mauris auctor tempor tellus, a semper ipsum vestibulum id. Etiam sit amet ligula quam.</p><p>

Phasellus ullamcorper purus sed justo pretium laoreet. Sed nunc felis, mattis et elit vitae, pretium rutrum ipsum. Morbi eu orci ut leo feugiat luctus. Cras ultricies consectetur sem eu dapibus. In lacinia volutpat commodo. Nullam semper tempor odio, ac porta tellus luctus in. Ut consectetur, metus id scelerisque hendrerit, lorem odio commodo sapien, sed commodo mauris eros nec purus. Quisque in convallis ipsum. Mauris auctor tempor tellus, a semper ipsum vestibulum id. Etiam sit amet ligula quam.</p>"),
        ImageWidget.new(image: image)
      ])
    end

  end
end
