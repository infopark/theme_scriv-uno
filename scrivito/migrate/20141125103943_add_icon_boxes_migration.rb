class AddIconBoxesMigration < ::Scrivito::Migration
  def up
    p = Obj.find_by_path("/misc/icon_boxes")
    p.update(content: [
      HeadlineWidget.new(headline: "Your Benefits"),
      ThreeColumnWidget.new(
        column_1: [
          BoxWidget.new(show_frame: "no", content: [
            IconBoxWidget.new(icon: "mobile", background_color: "white", size: "medium"),
            TextWidget.new(content: "<h3>Mobile to the max</h3>
              <p>Build websites for desktop computers and mobile devices.</p>")
          ])], 
        column_2: [
          BoxWidget.new(show_frame: "no", content: [
            IconBoxWidget.new(icon: "home", color: "blue", background_color: "white", size: "medium"),
            TextWidget.new(content: "<h3>Bootstrap bootstraps you</h3>
              <p>We love Bootstrap, so it's included right away. Just use this boilerplate app.</p>")
          ])], 
        column_3: [
          BoxWidget.new(show_frame: "no", content: [
            IconBoxWidget.new(icon: "lock", color: "green", background_color: "white", size: "medium"),
            TextWidget.new(content: "<h3>Security</h3>
              <p>We leverage all the security measures and advantages that AWS provides to always keep your data secure.</p>")
          ])]
      ),
      HeadlineWidget.new(headline: "And More"),
      ThreeColumnWidget.new(
        column_1: [
          BoxWidget.new(show_frame: "yes", content: [
            IconBoxWidget.new(icon: "globe", size: "medium"),
            TextWidget.new(content: "<h3>Act locally, work globally</h3>
              <p>Multiple language support and internationalization work seamlessly, powered by Rails I18n.</p>")
          ])], 
        column_2: [
          BoxWidget.new(show_frame: "yes", colour: "grey", content: [
            IconBoxWidget.new(icon: "star", color: "blue", size: "medium"),
            TextWidget.new(content: "<h3>Get your content delivered. Fast.</h3>
              <p>Your content is fast because of our great CDN. We deliver your stuff from the cloud, directly to your customers.</p>")
          ])], 
        column_3: [
          BoxWidget.new(show_frame: "yes", content: [
            IconBoxWidget.new(icon: "database", color: "green", size: "medium"),
            TextWidget.new(content: "<h3>Scalable and available</h3>
              <p>Distibuted over three data centres, we're always there for you.</p>")
          ])]
      ),
      HeadlineWidget.new(headline: "Your Benefits"),
      ThreeColumnWidget.new(
        column_1: [
          BoxWidget.new(show_frame: "yes", colour: "green", content: [
            IconBoxWidget.new(icon: "mobile", color: "blue", size: "medium"),
            TextWidget.new(content: "<h3>Mobile to the max</h3>
              <p>Build websites for desktop computers and mobile devices.</p>")
          ])], 
        column_2: [
          BoxWidget.new(show_frame: "yes", colour: "blue", content: [
            IconBoxWidget.new(icon: "home", color: "blue", background_color: "white", size: "medium"),
            TextWidget.new(content: "<h3>Bootstrap bootstraps you</h3>
              <p>We love Bootstrap, so it's included right away. Just use this boilerplate app.</p>")
          ])], 
        column_3: [
          BoxWidget.new(show_frame: "yes", colour: "green", content: [
            IconBoxWidget.new(icon: "lock", color: "green", background_color: "white", size: "medium"),
            TextWidget.new(content: "<h3>Security</h3>
              <p>We leverage all the security measures and advantages that AWS provides to always keep your data secure.</p>")
          ])]
      )
    ])
  end
end
