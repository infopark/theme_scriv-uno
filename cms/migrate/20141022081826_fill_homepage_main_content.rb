class FillHomepageMainContent < ::Scrivito::Migration
  def up

    # upload emtpy grey image:
    Image.create(_path: "/images/grey", blob: File.new("app/assets/images/dummy/grey.png"))

    # TWO-COLUMN ROW
    #add two-column widget:
    twocol = Homepage.default.main_content << TwoColumnWidget.new
    Homepage.default.update(main_content: twocol)

    #fill two-column widget with listitem widgets:
    left = ListitemWidget.new(headline: "Headline of left Content", headline_level: "h2", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...", image: Image.find_by_path("/images/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "Click!"))
    right = ListitemWidget.new(headline: "Headline of Content on the right", headline_level: "h2", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...", image: Image.find_by_path("/images/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "More info"))
    col1 = Homepage.default.main_content[0].column_1 << left
    Homepage.default.main_content[0].update(column_1: col1)
    col2 = Homepage.default.main_content[0].column_2 << right
    Homepage.default.main_content[0].update(column_2: col2)

    # THREE-COLUMN ROW
    #add three-column widget:
    threecol = Homepage.default.main_content << ThreeColumnWidget.new
    Homepage.default.update(main_content: threecol)

    #fill three-column widget with widgets:
    left_one = HeadlineWidget.new(headline: "Latest News")
    left_two = ListitemWidget.new(headline: "Headline first item", subline: "Chicago, 22.-30.01", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum ...", image: Image.find_by_path("/images/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "Click!"))
    left_three = ListitemWidget.new(headline: "Headline of Content ", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte ...", image: Image.find_by_path("/images/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "More info"))
    left_four = ListitemWidget.new(headline: "Headline of Content ", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte lorem ipsum...", image: Image.find_by_path("/images/grey"), link: Scrivito::Link.new(obj: Homepage.default, title: "More info"))

    col1 = Homepage.default.main_content[1].column_1 << left_one << left_two << left_three << left_four
    Homepage.default.main_content[1].update(column_1: col1)

    middle = AccordionWidget.new()
    col2 = Homepage.default.main_content[1].column_2 << middle
    Homepage.default.main_content[1].update(column_2: col2)

    # create panels:
    (1..3).each do |index|
      panel = AccordionPanelWidget.new(headline: "Collapsible Headline #{index}")
      panels = Homepage.default.main_content[1].column_2[0].panels << panel
      Homepage.default.main_content[1].column_2[0].update(panels: panels)
      panelwidget = TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.")
      p = Homepage.default.main_content[1].column_2[0].panels[index - 1].main_content << panelwidget
      Homepage.default.main_content[1].column_2[0].panels[index - 1].update(main_content: p) 
    end

    right = TeaserWidget.new(headline: 'Lorem ipsum', content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")

    col3 = Homepage.default.main_content[1].column_3 << right
    Homepage.default.main_content[1].update(column_3: col3)

    #TEXT ROW
    #add two-column widget to Homepage main content:
    twocol = Homepage.default.main_content << TwoColumnWidget.new
    Homepage.default.update(main_content: twocol)

    #fill two-column widget with stuff:
    left = TextWidget.new(content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")
    right = TextWidget.new(content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")
    col1 = Homepage.default.main_content[2].column_1 << left
    Homepage.default.main_content[2].update(column_1: col1)
    col2 = Homepage.default.main_content[2].column_2 << right
    Homepage.default.main_content[2].update(column_2: col2)

  end
end
