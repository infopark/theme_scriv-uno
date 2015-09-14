class AddIconBoxesMigration < ::Scrivito::Migration
  def up
    p = Obj.find_by_path("/scrivito")
    p.body.first.update(column_2: [
      HeadlineWidget.new(headline: "Scrivito"),
      ThreeColumnWidget.new(
        column_1: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "cloud", background_color: "bg_white", size: "medium"),
            TextWidget.new(text: "<h3>Your Cloud CMS</h3>
              <p>Scrivito is a professional Cloud Content Management System built for Ruby on Rails.</p>")
          ])],
        column_2: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "male", background_color: "bg_white", size: "medium"),
            TextWidget.new(text: "<h3>No editor training</h3>
              <p>Your clients edit content in-place, directly on the website. Without training or HTML skills.</p>")
          ])],
        column_3: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "dashboard", color: "bg_green", background_color: "bg_white", size: "medium"),
            TextWidget.new(text: "<h3>No installation required</h3>
              <p>Scrivito is a cloud service. Just focus on the functionality and look of your website.</p>")
          ])]
      ),
      HeadlineWidget.new(headline: "Your Benefits"),
      ThreeColumnWidget.new(
        column_1: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "mobile", background_color: "bg_white", size: "medium"),
            TextWidget.new(text: "<h3>Mobile to the max</h3>
              <p>Build websites for desktop computers and mobile devices.</p>")
          ])],
        column_2: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "home", color: "bg_blue", background_color: "bg_white", size: "medium"),
            TextWidget.new(text: "<h3>You are bootstrapped</h3>
              <p>We love Bootstrap, so it's included right away. Just use this boilerplate app.</p>")
          ])],
        column_3: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "lock", color: "bg_green", background_color: "bg_white", size: "medium"),
            TextWidget.new(text: "<h3>Security</h3>
              <p>We leverage all of AWS's security measures to keep your data secure.</p>")
          ])]
      ),
      HeadlineWidget.new(headline: "And More"),
      ThreeColumnWidget.new(
        column_1: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "globe", size: "medium", background_color: "bg_white"),
            TextWidget.new(text: "<h3>Act locally, work globally</h3>
              <p>Multiple language support and internationalization powered by I18n.</p>")
          ])],
        column_2: [
          BoxWidget.new(colour: "bg_grey1", content: [
            IconBoxWidget.new(icon: "star", color: "bg_blue", size: "medium", background_color: "bg_grey1"),
            TextWidget.new(text: "<h3>Get your content delivered. Fast.</h3>
              <p>We deliver your stuff from the cloud, directly to your customers.</p>")
          ])],
        column_3: [
          BoxWidget.new(content: [
            IconBoxWidget.new(icon: "database", color: "bg_green", size: "medium", background_color: "bg_white"),
            TextWidget.new(text: "<h3>Scalable and available around the World</h3>
              <p>Distibuted over three data centres, we're always there for you.</p>")
          ])]
      ),
    ])
  end
end
