class FillScrivitoContentMigration < ::Scrivito::Migration
  def up
    s = Obj.find_by_path("/scrivito")
    s.update(header_image: Image.find_by_path("/_resources/teaser_02"))
    s.body.first.update(column_2: [
      HeadlineWidget.new(headline: "A professional Cloud CMS built for Ruby on Rails."),
      TextWidget.new(text: "<h3>A professional Cloud CMS built for Ruby on Rails.</h3>
          <p>With Scrivito, you can develop your website like you always did. It just works, and it just works \"The Rails Way\".</p>
          <h3>No training for your editors required.</h3>
          <p>Your clients can edit content in-place, directly on the website itself. Intuitively, without any training or HTML skills.</p>
          <h3>No installation required</h3>
          <p>You should focus on the important things: Developing the functionality and look of your website. That's why we built Scrivito as a cloud service. So you don't have to keep on updating your CMS or worry about uptime all the time. And you always get the newest features.</p>")
    ])

    s = Obj.find_by_path("/scrivito/rails")
    s.update(header_image: Image.find_by_path("/_resources/teaser_03"))
    s.body.first.update(column_2: [
      HeadlineWidget.new(headline: "What is Rails?"),
      TextWidget.new(text: "<p>Rails is a web application development framework written in the Ruby language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks. Experienced Rails developers also report that it makes web application development more fun.</p>
      <p>Rails is opinionated software. It makes the assumption that there is the 'best' way to do things, and it's designed to encourage that way - and in some cases to discourage alternatives. If you learn 'The Rails Way' you'll probably discover a tremendous increase in productivity. If you persist in bringing old habits from other languages to your Rails development, and trying to use patterns you learned elsewhere, you may have a less happy experience.</p>"),
      HeadlineWidget.new(headline: "Principles"),
      TextWidget.new(text: "<p>The Rails philosophy includes two major guiding principles:</p>
        <ul><li><strong>Don't Repeat Yourself:</strong> DRY is a principle of software development which states that \"Every piece of knowledge must have a single, unambiguous, authoritative representation within a system.\" By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.</li>
        <li><strong>Convention Over Configuration:</strong> Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify every minutiae through endless configuration files.</li></ul>"),
      HeadlineWidget.new(headline: "For more"),
      TextWidget.new(text: "<p>Find everything you need on</p>
        <ul>
        <li><a href=\"http://rubyonrails.org/\" target=\"_blank\">http://rubyonrails.org/</a></li>
        <li><a href=\"http://railscasts.com/\" target=\"_blank\">http://railscasts.com/</a></li></ul>")
    ])

    # sort 'em:
    Obj.find_by_path("/scrivito").update(child_order: [Obj.find_by_path("/scrivito/rails"), Obj.find_by_path("/scrivito/modify")])

  end
end
