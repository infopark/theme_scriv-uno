class CreateContactPage < ::Scrivito::Migration
  def up
    p = Obj.find_by_path("/contact")
#    p.update(content: p.content << GoogleMapsWidget.new(address: "Kitzingstr. 15, 12277 Berlin, Germany"))
#    p.update(content: p.content << HeadlineWidget.new(headline: "Infopark AG"))    
#    p.update(content: p.content << TextWidget.new(content: "<p>Kitzingstr. 15<br>D-12277 Berlin</p>\n<p>T: +49 30 747993-0</p>\n<p><a href=\"mailto:info@infopark.com\">info@infopark.com</a></p>"))    
  end
end
