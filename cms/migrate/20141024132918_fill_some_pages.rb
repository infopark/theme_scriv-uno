class FillSomePages < ::Scrivito::Migration
  def up
   ["/about_us", "/news", "/about_us/sub_content", "/about_us/next_sub_content"].each do |path|
      page = Page.find_by_path(path)
      if path.length < 10
        page.update(teaser_headline: "Defense Commissary Agency Sees Environmental and more Impacts")
        page.update(teaser_content: "Lorem cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer im ipsum dolor sit amte dor sita lorem doro am tusa lis Lormor amet lorem ipsum dolor sit amte dor sita lorem doro am tiz usa lisat. Lormor amet lorem ipsum...")
      end
      mc = page.content << TextWidget.new(content: "<p>Donec risus ante, hendrerit quis rhoncus in, efficitur eget mi. Donec eu mattis lectus. Aenean egestas fermentum eros, a semper enim dictum quis. Aliquam erat volutpat. Sed dictum, odio at bibendum pulvinar, nisi ex porttitor arcu, vel posuere dui diam id diam. Suspendisse potenti. Phasellus sodales dictum lectus faucibus tristique. Vestibulum non ornare neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In dictum suscipit eleifend. Aenean ultricies tortor quis nisi euismod, id vehicula neque eleifend.</p><p>

Phasellus ullamcorper purus sed justo pretium laoreet. Sed nunc felis, mattis et elit vitae, pretium rutrum ipsum. Morbi eu orci ut leo feugiat luctus. Cras ultricies consectetur sem eu dapibus. In lacinia volutpat commodo. Nullam semper tempor odio, ac porta tellus luctus in. Ut consectetur, metus id scelerisque hendrerit, lorem odio commodo sapien, sed commodo mauris eros nec purus. Quisque in convallis ipsum. Mauris auctor tempor tellus, a semper ipsum vestibulum id. Etiam sit amet ligula quam.</p><p>

Phasellus ullamcorper purus sed justo pretium laoreet. Sed nunc felis, mattis et elit vitae, pretium rutrum ipsum. Morbi eu orci ut leo feugiat luctus. Cras ultricies consectetur sem eu dapibus. In lacinia volutpat commodo. Nullam semper tempor odio, ac porta tellus luctus in. Ut consectetur, metus id scelerisque hendrerit, lorem odio commodo sapien, sed commodo mauris eros nec purus. Quisque in convallis ipsum. Mauris auctor tempor tellus, a semper ipsum vestibulum id. Etiam sit amet ligula quam.</p>")
      page.update(content: mc)
    end

  end
end
