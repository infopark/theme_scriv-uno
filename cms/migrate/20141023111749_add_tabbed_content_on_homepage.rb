class AddTabbedContentOnHomepage < ::Scrivito::Migration
  def up
    # add TABBED CONTENT
    tb = Homepage.default.main_content << TabbedContentWidget.new
    Homepage.default.update(main_content: tb)
    tabsw = Homepage.default.widget_from_pool(tb.last.id)

    # fill Tabbed Content:
    # create tabs:
    (1..3).each do |index|
      image = Image.create(_path: "/images/teaser0#{index + 4}", blob: File.new("app/assets/images/dummy/teaser_0#{index + 4}.jpg"))
      tabsw.tabs << TabbedContentTabWidget.new(headline: "Built For Ruby on Rails")
      tabsw.update(tabs: tabsw.tabs)
      tab = tabsw.tabs.last
      twocol = tab.content << TwoColumnWidget.new()
      tab.update(content: twocol)
      if index != 2
        text = tab.content.last.column_1 << TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.")
        tab.content.last.update(column_1: text)
        image = tab.content.last.column_2 << ImageWidget.new(source: image)
        tab.content.last.update(column_2: image)
      else
        text = tab.content.last.column_2 << TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.")
        tab.content.last.update(column_2: text)
        image = tab.content.last.column_1 << ImageWidget.new(source: image)
        tab.content.last.update(column_1: image)
      end
    end

    tabsw.tabs[1].update(headline: "Your clients will love it, too!")   
    tabsw.tabs[1].update(headline: "It's a cloud service.")   
 
  end
end
