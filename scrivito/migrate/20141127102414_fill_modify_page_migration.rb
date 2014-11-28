class FillModifyPageMigration < ::Scrivito::Migration
  def up
    p = Obj.find_by_path("/scrivito/modify")
    p.content.first.update(column_2: [
      TextWidget.new(content: "<p>You can modify this app according to your needs. While it already contains a number of basic page types and a collection of widgets you certainly come to the point where you want to add your own formats and page elements. Check the <a href=\"https://scrivito.com/documentation\" target=\"_blank\">Scrivito Documentation</a> for all the details. This page is just to give you some orientation.</p>
        <h3>Pages (ObjClasses)</h3>
        <p>This theme app comes with a handful of basic page types. We call them Object Classes. Existing object classes are 'Page', 'Homepage' and 'Person'. Each of those classes is being created by a migration (in folder Rails.root/scrivito/migrate). They each have their class definition in app/models and their own views. Feel free to tweak the 'index' views of the existing classes to achieve a different page layout for all Scrivito objects of that class. For instance, if you want to change the layout of the standard pages (ObjClass 'Page') just go to Rails.root/app/views/page/index.html.erb and modify the width of the columns, the teaser display or whatever you fancy.</p>
        <p>You can also add attributes to the existing classes and then use those attributes to refine the view files. Or you can create new object classes to hold and display new kinds of content, e.g. product pages, news...</p>
        <p>You can create new object classes by writing a migration for them. Then add their class definition to your app's models and add at least an index view for them.</p>
        <p>This theme app also creates a number of Scrivito objects directly via the migrations. There is no need to do that, however. You can simply create your new pages directly via the app's inline editing mode. We do it in the migrations for this app only because you started from a fresh and empty tenant.</p>
        <p>More about all that on <a href=\"https://scrivito.com/6b69746bd92e34b5\" target=\"_blank\">CMS Objects, Widgets, and Classes</a> in the Scrivito Documentation.</p>
        <h3>Widgets</h3>
        <p>This app comes with quite an assortment of widgets already. Some are being delivered from gems that we have integrated. Check out the Gemfile to see which ones they are. And see <a href=\"http://rubygems.org/search?query=scrivito\" target=\"_blank\">RubyGems Scrivito</a> for more available gems. You can always unpack those gems or find them on github in order to look how they do what they do.</p>
        <p>This app contains a number of smaller widgets that have not made it into a gem of their own. These are 'HeadlineWidget', 'BackgroundWidget', 'BoxWidget', 'ImageWidget', 'ListitemWidget' and 'PersonWidget'. Look at them to understand how widgets basically work. And feel free to toy around with them by altering their 'show' view, their attribute values and 'details' view. We also overwrite the 'show' view of one of the gemified widgets in our app: 'app/views/icon_box_widget/show'. That is because our styles called for a different display of the widget values.</p>
        <p>Find more about Widgets, what they can do for you and what you can do with them on <a href=\"https://scrivito.com/1bc3ecd41ddc80db\" target=\"_blank\">Creating a Page Type with Widgets</a> in the Scrivito Documentation.</p>"
      )
    ])
  end
end
