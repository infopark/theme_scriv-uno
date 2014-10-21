class FillMainContentForHomepage < ::Scrivito::Migration
  def up
    # TEASER ROW
    #add two-column widget to Homepage main content:
    twocol = Homepage.default.main_content << TwoColumnWidget.new
    Homepage.default.update(main_content: twocol)

    #fill two-column widget with teaser widgets:
    left = TeaserWidget.new(headline: "Headline of left Content", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...", link_to: Scrivito::Link.new(obj: Homepage.default, title: "Click!"))
    right = TeaserWidget.new(headline: "Headline of Content on the right", content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...", link_to: Scrivito::Link.new(obj: Homepage.default, title: "More info"))
    col1 = Homepage.default.main_content[0].column_1 << left
    Homepage.default.main_content[0].update(column_1: col1)
    col2 = Homepage.default.main_content[0].column_2 << right
    Homepage.default.main_content[0].update(column_2: col2)

    #TEXT ROW
    #add two-column widget to Homepage main content:
    twocol = Homepage.default.main_content << TwoColumnWidget.new
    Homepage.default.update(main_content: twocol)

    #fill two-column widget with stuff:
    left = TextWidget.new(content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")
    right = TextWidget.new(content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")
    col1 = Homepage.default.main_content[1].column_1 << left
    Homepage.default.main_content[1].update(column_1: col1)
    col2 = Homepage.default.main_content[1].column_2 << right
    Homepage.default.main_content[1].update(column_2: col2)

    #TEXT
    #add text widget to Homepage main content:
    text = Homepage.default.main_content << TextWidget.new(content: "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.")
    Homepage.default.update(main_content: text)

  end
end
