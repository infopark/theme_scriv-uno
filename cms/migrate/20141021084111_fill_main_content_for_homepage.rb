class FillMainContentForHomepage < ::Scrivito::Migration
  def up
    #add two-column widget to Homepage main content:
    twocol = Homepage.default.main_content << TwoColumnWidget.new
    Homepage.default.update(main_content: twocol)

    #fill two-column widget with stuff:
    left = TextWidget.new(content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")
    right = TextWidget.new(content: "IFCOl im ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tusa lisat. Lormor amet lorem ipsum...")
    col1 = Homepage.default.main_content[0].column_1 << left
    Homepage.default.main_content[0].update(column_1: col1)
    col2 = Homepage.default.main_content[0].column_2 << right
    Homepage.default.main_content[0].update(column_2: col2)
  end
end
